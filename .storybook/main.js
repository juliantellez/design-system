const path = require("path");

const jsRules = require("./webpack/jsRule")
const cssRules = require("./webpack/cssRule")

const PATH_ROOT = path.resolve(__dirname, "..");
const PATH_SRC = path.resolve(PATH_ROOT, "./src");

module.exports = {
    stories: [
        path.resolve(PATH_SRC, "./**/*.stories.ts"),
        path.resolve(PATH_SRC, "./**/*.stories.tsx")
    ],
    addons: ["@storybook/addon-actions", "@storybook/addon-links"],
    webpackFinal: config => {
        config.module.rules = [
            jsRules,
            cssRules
        ];
        config.resolve = {
            extensions: [".tsx", ".ts", ".js"]
        }

        return config;
    }
};
