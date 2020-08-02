/* eslint no-console:0 */

import "stylesheets/application"
import "core-js/stable"
import "regenerator-runtime/runtime"
import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';

Rails.start();
Turbolinks.start();

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

console.log('Hello World from Webpacker')
