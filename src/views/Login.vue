<template>
  <div class="login">
    <div class="container">
      <form method="post" action="" class="form">
        <div><p>登录</p></div>
        <div class="form-group">
          <div class="field field-icon">
            <span class="icon text-gray">
              <img src="../assets/images/imgs/user.png" />
            </span>
            <input
              type="text"
              class="input"
              id="username"
              name="username"
              placeholder="请输入您的用户名"
              v-model="username"
            />
          </div>
        </div>
        <div class="form-group">
          <div class="field field-icon">
            <span class="icon text-gray">
              <img src="../assets/images/imgs/psd.png" />
            </span>
            <input
              type="password"
              class="input"
              id="password"
              name="password"
              placeholder="请输入您的密码"
              v-model="password"
            />
          </div>
        </div>
        <div class="form-group">
          <label class="remember">
            <input
              type="checkbox"
              id="remember"
              name="remember"
              checked="checked"
            />记住密码
          </label>
          <div class="forget">
            <a href="" target="blank">找回密码</a>
          </div>
        </div>
        <div class="form-group">
          <button id="submit" type="submit" @click.prevent="handlelogin()">
            登录
          </button>
        </div>
      </form>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "login",
  data() {
    return {
      username: "",
      password: "",
    };
  },
  methods: {
    handlelogin() {
      if (this.username === "") {
        //名字为空
        alert("请输入用户名");
      } else if (this.password === "") {
        //密码为空
        alert("请输入密码");
      } else {
        axios
          .post("http://localhost:3000/api/login", { username: this.username })
          .then((response) => {
            if (response.data[0]) {
              if (response.data[0].password == this.password) {
                this.$store.commit("changloginid", response.data[0].loginid);
                this.$store.commit("changrole", response.data[0].role);
                this.$store.commit("changpassword", response.data[0].password);
                if (response.data[0].role == "student") {
                  this.$router.push("/Student");
                } else if (response.data[0].role == "admin") {
                  this.$router.push("/DAdmin");
                }
              } else {
                alert("密码错误!");
              }
            } else {
              alert("用户名不存在!");
            }
          })
          .catch((error) => {
            console.log("error:" + error);
          });
      }
    },
  },
  beforeDestroy() {
    axios
      .post("http://localhost:3000/api/stuinfo", { sid: this.username })
      .then((response) => {
        this.$store.commit("changdor", response.data[0].dor);
      })
      .catch((error) => {
        console.log("error:" + error);
      });
  },
};
</script>
<style scoped>
.login {
  height: 100%;
  width: 100%;
  position: fixed;
  background-size: cover;
  background: url("../assets/images/imgs/login.png") no-repeat center;
}
.container {
  max-width: 400px;
  box-sizing: border-box;
  border-radius: 8px;
  background-color: rgb(255 255 255 / 80%);
  margin: 0 auto;
}
.form {
  margin: 10px 40px;
}
.form .form-group .input {
  width: 300px;
}
.form-group {
  overflow: hidden;
  padding-bottom: 10px;
}
.input {
  font-size: 14px;
  padding: 6px;
  border: solid 1px #ddd;
  width: 100%;
  height: 34px;
  line-height: 20px;
  display: block;
  border-radius: 4px;
  -webkit-appearance: none;
  box-shadow: 0 1px 1px rgb(0 0 0 / 8%) inset;
  transition: all 1s cubic-bezier(0.175, 0.885, 0.32, 1) 0s;
}
.form .form-group .input {
  font-size: 19px;
  height: 60px;
  line-height: 34px;
  text-indent: 40px;
  padding: 0;
  display: block;
  border-radius: 2px;
  border: solid 1px #ccc;
  border-top: 0px;
  border-left: 0px;
  border-right: 0px;
  background: none;
  outline: none;
  box-shadow: none;
  padding-left: 30px;
}
span {
  margin-top: 10px;
}
.field {
  position: relative;
}
.field-icon .icon {
  border: 0px;
  line-height: 60px;
}
.field-icon .icon {
  position: absolute;
  left: 0;
  right: auto;
  width: 34px;
  height: 34px;
  text-align: center;
  line-height: 34px;
  font-size: 16px;
  font-weight: normal;
}
.icon img {
  vertical-align: middle;
}
p {
  font-size: 23px;
  text-align: center;
  padding: 20px 0 0 0;
  font-weight: bold;
  color: #6d727a;
}
.remember {
  float: left;
}
a {
  text-decoration: none;
  color: black;
  float: right;
}
a:hover {
  color: blue;
}
button {
  background-color: #00b2ff;
  color: white;
  border: solid 1px #ddd;
  width: 100px;
  height: 50px;
}
#submit {
  float: left;
}
#regester {
  float: right;
}
</style>