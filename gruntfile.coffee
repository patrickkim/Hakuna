module.exports = (grunt) ->
  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")
    sass:
      dist:
        files:
         "dev/<%= pkg.build_file_name %>.css": "src/sass/app_style_manifest.scss"

    coffee:
      dist:
        files: [
          expand: true,
          flatten: true,
          cwd: "src/coffee",
          src: ["*.coffee"],
          dest: "dev/js",
          ext: ".js"
        ]

    concat:
      options:
        separator: ";"
      dist:
        src: [
          "src/javascripts/jquery-2.1.0.js"
          "src/javascripts/underscore-1.6.0.js"
          "src/javascripts/backbone-1.1.2.js"
          "dev/js/**/*.js"
        ]
        dest: "dev/<%= pkg.build_file_name %>-<%=pkg.version %>.js"

    watch:
      css:
        files: "src/**/*.scss",
        tasks: "sass"
      coffee:
        files: "src/**/*.coffee"
        tasks: "coffee"
      concat:
        files: "dev/js/**/*.js"
        tasks: "concat"

    uglify:
      options:
        mangle: true
        report: "min"
      my_target:
        files:
          "build/<%= pkg.build_file_name %>-<%=pkg.version %>.min.js": ["dev/<%= pkg.build_file_name %>-<%=pkg.version %>.js"]

    cssmin:
      options:
        report: "min"
      combine:
        files:
          "build/<%= pkg.build_file_name %>.min.css": ["dev/<%= pkg.build_file_name %>.css"]

    clean:
      dev: ["dev"]
      build: ["build"]
  )

  grunt.loadNpmTasks("grunt-contrib-sass")
  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks("grunt-contrib-concat")
  grunt.loadNpmTasks("grunt-contrib-watch")
  grunt.loadNpmTasks("grunt-contrib-uglify")
  grunt.loadNpmTasks("grunt-contrib-cssmin")
  grunt.loadNpmTasks('grunt-contrib-clean')

  grunt.registerTask("default", ["sass", "coffee", "concat", "watch"])
  grunt.registerTask("build", ["clean:dev", "clean:build", "sass", "coffee", "cssmin", "concat", "uglify", "clean:dev"])
  grunt.registerTask("reset", ["clean:dev", "clean:build"])

