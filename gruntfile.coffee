module.exports = (grunt) ->
  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")
    connect:
      server:
        options:
          port: 5555
          base: "www"

    sass:
      compile:
        files:
         ".tmp/dev/stylesheets/<%= pkg.build_file_name %>.css": "src/sass/app_style_manifest.scss"

    coffee:
      app:
        files: [
          expand: true
          cwd: "src/coffee",
          src: ["**/*.coffee"]
          dest: ".tmp/js"
          ext: ".js"
        ]
      tests:
        files: [
          expand: true
          cwd: "tests",
          src: ["**/*.coffee"]
          dest: ".tmp/tests"
          ext: ".js"
        ]

    eco:
      options:
        basePath: "src/templates"
      app:
        src: ["src/templates/**/*.eco"]
        dest: "www/assets/templates/templates.js"

    concat:
      app:
        src: [
          "src/javascripts/jquery-2.1.0.js"
          "src/javascripts/underscore-1.6.0.js"
          "src/javascripts/backbone-1.1.2.js"
          ".tmp/js/lib/*.js"
          ".tmp/js/app.js"
          ".tmp/js/mixins/*.js"
          ".tmp/js/models/*.js"
          ".tmp/js/views/*.js"
        ]
        dest: ".tmp/dev/javascripts/<%= pkg.build_file_name %>.js"
      tests:
        src: [
          ".tmp/tests/**/*.js"
        ]
        dest: "www/tests/suite/app_tests.js"

    watch:
      css:
        files: "src/**/*.scss",
        tasks: ["clean:css", "sass", "copy:css"]
      coffee:
        files: "src/**/*.coffee"
        tasks: ["clean:js","coffee:app", "concat:app", "copy:js"]
      eco:
        files: "src/**/*.eco"
        tasks: ["eco"]
      tests:
        files: "tests/**/*.coffee"
        tasks: ["clean:tests","coffee:tests", "concat:tests"]

    uglify:
      options:
        mangle: true
        report: "min"
      my_target:
        files:
          "build/javascripts/<%= pkg.build_file_name %>.js": [".tmp/dev/javascripts/<%= pkg.build_file_name %>.js"]

    cssmin:
      options:
        report: "min"
      combine:
        files:
          "build/stylesheets/<%= pkg.build_file_name %>.css": [".tmp/dev/stylesheets/<%= pkg.build_file_name %>.css"]

    clean:
      default: [".tmp", "build", "www/assets/javascripts/*", "www/assets/stylesheets/*"]
      tests: [".tmp/tests/*", "www/tests/suite/*"]
      temp: [".tmp"]
      css: [".tmp/dev/stylesheets/*"]
      js: [".tmp/js", ".tmp/dev/javascripts/*"]

    copy:
      css:
        cwd: ".tmp/dev/stylesheets"
        src: "*"
        dest: "www/assets/stylesheets"
        expand: true
      js:
        cwd: ".tmp/dev/javascripts"
        src: "*"
        dest: "www/assets/javascripts"
        expand: true
      dev:
        cwd: ".tmp/dev"
        src: "**/*"
        dest: "www/assets"
        expand: true
      build:
        cwd: "build"
        src: "**/*"
        dest: "www/assets"
        expand: true

  )

  grunt.loadNpmTasks("grunt-contrib-sass")
  grunt.loadNpmTasks("grunt-eco")
  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks("grunt-contrib-concat")
  grunt.loadNpmTasks("grunt-contrib-watch")
  grunt.loadNpmTasks("grunt-contrib-uglify")
  grunt.loadNpmTasks("grunt-contrib-cssmin")
  grunt.loadNpmTasks("grunt-contrib-clean")
  grunt.loadNpmTasks("grunt-contrib-copy")
  grunt.loadNpmTasks("grunt-contrib-connect")

  grunt.registerTask("default", ["clean", "coffee", "sass", "eco", "concat", "copy:dev", "connect", "watch"])
  grunt.registerTask("build", ["clean", "coffee", "sass", "eco", "concat", "uglify", "cssmin", "copy:build"])
  grunt.registerTask("production", ["clean", "coffee", "sass", "eco", "concat", "uglify", "cssmin", "copy:build", "connect:server:keepalive"])
