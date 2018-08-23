const fs = require('fs')
const JSDOM = require('jsdom').JSDOM
const showdown  = require('showdown')
const converter = new showdown.Converter()

const template = fs.readFileSync('template.html', {encoding: 'utf-8'})
const { window } = new JSDOM(template);
const { document } = (new JSDOM(template)).window;
const container = document.querySelector('#md-container')

fs.readFile("./README.md", {encoding: 'utf-8'}, (err, md) => {
  const html = converter.makeHtml(md)
  const title = (new JSDOM(html)).window.document.querySelector('h1').textContent

  document.title = title
  container.innerHTML = html

  console.log(document.documentElement.outerHTML)
})
