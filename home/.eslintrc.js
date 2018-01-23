// http://eslint.org/docs/user-guide/configuring

module.exports = {
  root: true,
  parserOptions: {
    ecmaVersion: 2017,
    sourceType: "module",
    ecmaFeatures: {
      experimentalObjectRestSpread: true
    }
  },
  extends: ["eslint:recommended"],
  env: {
    node: true,
    es6: true
  },
  rules: {
    // allow debugger during development
    "no-debugger": process.env.NODE_ENV === "production" ? 2 : 0,
    // allow console during development
    "no-console": process.env.NODE_ENV === "production" ? 1 : 0,
    // unused vars should just be a warning during development
    "no-unused-vars": process.env.NODE_ENV === "production" ? 2 : 1
  }
};