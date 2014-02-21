module.exports = (grunt) ->
  grunt.initConfig(
    pkg: grunt.file.readJSON("package.json")
    connect:
      server:
        options:
          port: 5555
          base: "www"

    sass:
      dist:
        files:
         "dev/stylesheets/<%= pkg.build_file_name %>.css": "src/sass/app_style_manifest.scss"

    coffee:
      dist:
        files: [
          expand: true,
          flatten: true,
          cwd: "src/coffee",
          src: ["*.coffee"],
          dest: "tmp",
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
          "tmp/**/*.js"
        ]
        dest: "dev/javascripts/<%= pkg.build_file_name %>.js"

    watch:
      css:
        files: "src/**/*.scss",
        tasks: ["sass", "copy:css"]
      coffee:
        files: "src/**/*.coffee"
        tasks: ["coffee", "concat", "copy:js"]

    uglify:
      options:
        mangle: true
        report: "min"
      my_target:
        files:
          "build/javascripts/<%= pkg.build_file_name %>.js": ["dev/javascripts/<%= pkg.build_file_name %>.js"]

    cssmin:
      options:
        report: "min"
      combine:
        files:
          "build/stylesheets/<%= pkg.build_file_name %>.css": ["dev/stylesheets/<%= pkg.build_file_name %>.css"]

    clean:
      dev: ["tmp/*", "dev/*"]
      build: ["tmp/*", "dev/*", "build/*"]
      assets: ["www/assets/javascripts/*", "www/assets/stylesheets/*"]

    copy:
      css:
        cwd: "dev/stylesheets"
        src: "*"
        dest: "www/assets/stylesheets"
        expand: true
      js:
        cwd: "dev/javascripts"
        src: "*"
        dest: "www/assets/javascripts"
        expand: true
      dev:
        cwd: "dev"
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
  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks("grunt-contrib-concat")
  grunt.loadNpmTasks("grunt-contrib-watch")
  grunt.loadNpmTasks("grunt-contrib-uglify")
  grunt.loadNpmTasks("grunt-contrib-cssmin")
  grunt.loadNpmTasks("grunt-contrib-clean")
  grunt.loadNpmTasks("grunt-contrib-copy")
  grunt.loadNpmTasks("grunt-contrib-connect")

  grunt.registerTask("default", ["clean:dev", "clean:assets", "coffee", "sass", "concat", "copy:dev", "connect", "watch"])
  grunt.registerTask("build", ["clean:dev", "clean:build", "clean:assets", "coffee", "sass", "concat", "uglify", "cssmin", "clean:dev", "copy:build"])
  grunt.registerTask("production", ["clean:dev", "clean:build", "clean:assets", "coffee", "sass", "concat", "uglify", "cssmin", "clean:dev", "copy:build", "connect:server:keepalive"])
  grunt.registerTask("reset", ["clean:dev", "clean:build", "clean:assets"])

