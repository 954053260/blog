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
<style scoped>
  .comment-form p{
    margin: 10px 0;
    line-height: 30px;
  }
  .comment-form label{
    color: #666;
  }
  .comment-form input{
    height: 28px;
    width: 250px;
    border: 1px solid #39f;
  }
  .comment-form textarea{
    display: block;
    padding: 5px;
    width: 100%;
    max-width: 450px;
    height: 200px;
    border: 1px solid #39f;
  }
  .comment-form .submit{
    width: 100px;
    height: 36px;
    background-color: #f0f3f9;
    color: #333;
    overflow: visible;
    cursor: pointer;
    box-shadow: 1px 1px #AFC4EA, 2px 2px #AFC4EA, 3px 3px #AFC4EA;
    font-size: 14px;
  }
</style>
