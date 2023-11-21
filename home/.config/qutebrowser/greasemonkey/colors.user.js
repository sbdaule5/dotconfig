// ==UserScript==
// @name        Gruvbox it
// @description Set gruvbox like style for pages without stylesheet
// @version     0.1
// @author      Shubham
// @include     https://0x0.st
// @exclude     https://github.com*
// @exclude     https://search.brave.com*
// @exclude     https://*.reddit.com*
// @exclude     https://*.w3schools.com*
// ==/UserScript==

var sheet = window.document.styleSheets[0];
sheet.insertRule('body { color: #cbcbcb; font-family: monospace; }', sheet.cssRules.length);
sheet.insertRule('body a:link { color: #458588; text-decoration: "none";}', sheet.cssRules.length);
sheet.insertRule('body a:hover { text-decoration: underline;}', sheet.cssRules.length);
sheet.insertRule('body a:visited { color: #b16286; }', sheet.cssRules.length);
sheet.insertRule('body a:active { color: #cc241d; }', sheet.cssRules.length);
