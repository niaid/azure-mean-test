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
      tr(v-for="test in tests")
        td {{ test.name }} 
        td {{test.result}}
  
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';

@Component
export default class HelloWorld extends Vue {
  @Prop() private msg!: string;

  data() {
    return {
      tests: [
        {
          name: "foo", 
          result: "bar"
        },
        {
          name: "super_long_name_ok",
          result: "super_long_result_ok"
        }
      ]
    }
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
