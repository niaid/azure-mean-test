<template lang="pug">
.hello
  h1 {{ msg }}
  p For a guide and recipes on how to configure / customize this project, check out the a(href='https://cli.vuejs.org' target='_blank' rel='noopener') vue-cli documentation.

  h3 Tests

  br
  .w-100
    table.center
      tr
        th Name
        th Result
      tr
        td github
        td {{ githubResponse }}
  
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

interface IResults {
  github: string
}

var results: IResults = {
  github: "Unknown"
}

@Component
export default class HelloWorld extends Vue {
  @Prop() private msg!: string;

  get githubResponse() {
    return results.github;
  }

  checkNiaidGithub() {

    var http = require('http');
    var options = {
      host: 'https://github.niaid.nih.gov/',
      path: '/'
    };
    
    let callback = function(response: any) {
      results.github = '';

      response.on('data', function(chunk: any) {
        results.github += chunk;
      });

      //the whole response has been received, so we just print it out here
      response.on('end', function () {
        console.log( `Finished GET ${options.host}`)
      });
    }

    http.request(options, callback).end();
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="stylus">
.center
  margin-left: auto 
  margin-right: auto

th,td
  text-align: left
  padding-right: 1em

h3
  margin 40px 0 0

ul
  list-style-type none
  padding 0

li
  display inline-block
  margin 0 10px

a
  color #42b983
</style>
