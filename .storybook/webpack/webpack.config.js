const jsRules = require("./jsRule.js")
const cssRules = require("./cssRule.js")

const config = (env) => {
    return {
        rules: [
            jsRules,
            cssRules
        ],
        resolve: {
            extensions: [".tsx", ".ts", ".js"]
        }
    }
}

module.exports = config
