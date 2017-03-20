<template>
  <div id="email">
    <h3>留言</h3>
    <div class="comment-form">
      <p>
        <label>
          昵称: <input name="author" maxlength="20" v-model="author">
        </label>
      </p>
      <p>
        <label>
          邮件: <input name="email" maxlength="20" v-model="email">
        </label>
      </p>
      <p>
        <label>
          <textarea placeholder="输入留言..." v-model="text"></textarea>
        </label>
      </p>
      <p>
        <input type="submit" class="submit" value="提交" @click="submit()">
      </p>
    </div>
  </div>
</template>
<script type="text/ecmascript-6">
  export default {
    name: 'email',
    data: function () {
      return {
        author: '',
        email: '',
        text: ''
      }
  },
  methods: {
    submit: function () {

    }
  }
  }
</script>
<style>

</style>
