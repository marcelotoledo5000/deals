/* eslint no-console:0 */

/**
 * Refers to app/javascript/stylesheets/application.scss (or application.css)
 * Note that we don't need to preface this path with "app/javascript" due to the `source_path` config set in config/webpacker.yml. Magical!
 * The file extension can be left off due to the `extensions` config in config/webpacker.yml.
 */

import "stylesheets/application"
import "core-js/stable"
import "regenerator-runtime/runtime"

//= require_self
//= require rails-ujs
//= require turbolinks
//= require_tree .

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

console.log('Hello World from Webpacker')
