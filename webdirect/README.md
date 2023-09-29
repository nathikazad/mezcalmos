### Mezkala Redirection Page Styling

# Introduction

This README will guide you through the process of setting up Tailwind CSS and compiling it to an output.css file.

1. Install Tailwind CSS
   Run the following command to install Tailwind CSS via npm.

```
npm install tailwindcss
```

2. Initialize Tailwind Configuration File
   Create a Tailwind configuration file (tailwind.config.js) in your project root.

```
npx tailwindcss init
```

3. Configure Tailwind Configuration file with proper paths

```
/** @type {import('tailwindcss').Config} \*/
module.exports = {
content: ["./webdirect/**/\*.html"],
theme: {
extend: {},
},
plugins: [],
};
```

4. Add Tailwind Classes to HTML
   Open your index.html and start adding Tailwind classes to your HTML elements. Make sure to link the output.css is in the HTML head.

<link href="output.css" rel="stylesheet" />

5. Then, you can generate the output.css file using the following command:

```
npx tailwindcss build -o output.css
```
