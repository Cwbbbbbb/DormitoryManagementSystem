<template xmlns:el-col="http://www.w3.org/1999/html">
  <div id="index" class="stu">
    <el-row>
      <el-col :span="3">
        <stuside></stuside>
      </el-col>
      <el-col :span="21">
        <top></top>
        <router-view></router-view>
      </el-col>
    </el-row>
    <el-backtop target=".stu"><i class="el-icon-caret-top"></i></el-backtop>
  </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";
export default {
  computed: {
    ...mapState({
      role: (state) => state.role,
      loginid: (state) => state.loginid,
      password: (state) => state.password,
    }),
    ...mapGetters(["getrole", "getloginid", "getpassword"]),
  },
  created() {
    console.log("登录成功");
    console.log("用户名:" + this.loginid);
    console.log("密码:" + this.password);
    console.log("角色:" + this.role);
  },
  name: "index",
  components: {
    top: () => import("@/components/Top"),
    stuside: () => import("@/components/StuSide"),
  },
};
</script>
<style scoped>
.stu {
  height: 100vh;
  overflow-x: hidden;
}
</style>