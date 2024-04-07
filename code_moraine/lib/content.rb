#!/Users/$USER/.rbenv/shims/ruby || #!/usr/bin/ruby

$js_html_content = %(
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sample Application</title>
    <link rel="stylesheet" href="./styles/main.css" />
    <script type="module" src="./src/index.js" async defer></script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <h1>Sample Application</h1>
        <p>This is some text for the sample application.</p>
        <p>
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi
          qui eos voluptatum dignissimos dicta earum, minima doloribus itaque
          iusto eius soluta officiis eveniet, distinctio impedit facere quos
          incidunt quidem in!
        </p>
      </div>
    </div>
  </body>
</html>
)

$ts_html_content = %(
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sample Application</title>
    <link rel="stylesheet" href="./styles/main.css" />
    <script type="module" src="./build/index.js" async defer></script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <h1>Sample Application</h1>
        <p>This is some text for the sample application.</p>
        <p>
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi
          qui eos voluptatum dignissimos dicta earum, minima doloribus itaque
          iusto eius soluta officiis eveniet, distinctio impedit facere quos
          incidunt quidem in!
        </p>
      </div>
    </div>
  </body>
</html>
)

$css_main_content = %(
@import url('variables.css');
@import url('custom.css');
)

$scss_main_content = %(
@import 'variables',
@import 'custom';
)

$css_variables_content = %(
:root {
  --font-sans: "Roboto", sans-serif;
  --font-serif: "Roboto Slab", serif;
  --font-condensed: "Roboto Condensed", sans-serif;
  --font-mono: "Roboto Mono", monospaced;

  --darker: #222;
  --dark: #555;
  --grey: #ccc;
  --light-grey: #fdfdfd;

  --font-size: 16px;
  --sm: 0.75rem;
  --md: 1rem;
  --lg: 1.5rem;
  --xl: 1.75rem;
  --xxl: 2rem;
}
)

$scss_variables_content = %(
$font-sans: "Roboto", sans-serif !important;
$font-serif: "Roboto Slab", serif !important;
$font-condensed: "Roboto Condensed", sans-serif !important;
$font-mono: "Roboto Mono", monospaced !important;

$darker: #222 !important;
$dark: #555 !important;
$grey: #ccc !important;
$light-grey: #fdfdfd !important;

font-size: 16px !important default;
$sm: 0.75rem !important;
$md: 1rem !important;
$lg: 1.5rem !important;
$xl: 1.75rem !important;
$xxl: 2rem !important;
)

$css_custom_content = %(
html,
body {
  padding: 0;
  margin: 0;
  font-size: var(--font-size);
  color: var(--darker);
  background-color: var(--light-grey);
}
)

$scss_custom_content = %(
html,
body {
  padding: 0;
  margin: 0;
  font-size: font-size;
  color: darker;
  background-color: light-grey;
}
)

$js_content = %(
'use strict';

function sayName(name) {
  return name;
}

const myName = sayName("Chuck Norris");
console.log("Congratulations your application is running correctly! 🏄🏽‍♂️");
console.log(myName);
)

$ts_content = %(
function sayName(name: string): string {
  if (name) return `Hello {name}`;
  return `No string parameter was provided, please include a string variable.`;
}

const chuck = sayName('Chuck Norris');
console.log(chuck);
console.log('Congratulations your application is running correctly! 🏄🏽‍♂️');
)

$readme_content = %(
# <PUT Repo/Project NAME HERE>
)

$mit_license_content = %(
Copyright <YYYY> <YOUR NAME> [example website](https://example.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
)

$apache2_license_content = %(

)

$gplv3_license_content = %(

)

$gitignore_content = %(
# Editors:
.idea
.vscode
.vscodium
.fleet

# Project Files:
node_modules
.env
.env.prod
)

$babelrc_content = %(
{
  "presets": ["@babel/preset-env"]
}
)

$packagejson_js_scripts_content = %(
  "scripts": {
    "start-node": "nodemon ./src/index.js",
    "start-site": "lite-server index.html",
    "babel-node": "babel-node --presets='@babel/preset-env' --ignore='foo|bar|baz'",
  }
)
