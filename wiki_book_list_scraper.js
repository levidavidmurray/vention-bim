const fs = require('fs')
const jsdom = require('jsdom')
const axios = require('axios')

const file = './wiki_book_bestsellers.json'

let bestsellers = {}
if (fs.existsSync(file)) {
    bestsellers = JSON.parse(fs.readFileSync(file))
}

const years = [1991, 1994, 1997]

async function execute() {
    const promises = []
    for (let year of years) {
        const url = `https://en.wikipedia.org/w/api.php?action=parse&format=json&page=The_New_York_Times_Fiction_Best_Sellers_of_${year}&formatversion=2&redirects`
        const p = axios.get(url).then(({ data }) => {
            const { document } = new jsdom.JSDOM(data.parse.text).window
            let arr = []
            document.querySelectorAll('.wikitable tr').forEach(tr => {
                if (tr.childElementCount < 3) return
                let title = tr.children[1].textContent.replace('\n','').trim()
                let author = tr.children[2].textContent.replace('\n','').trim()
                let np = author.split(' ')
                if (np.includes('and')) return
                let firstName = np.slice(0, np.length-1).join(' ')
                let lastName = np[np.length-1]
                arr.push({ title, author: { firstName, lastName }})
            })
            arr.shift()
            bestsellers[year] = arr
        })
        promises.push(p)
    }
    await Promise.all(promises)
    fs.writeFileSync(file, JSON.stringify(bestsellers, null, 2))
}

execute()