<template xmlns:el-col="http://www.w3.org/1999/html">
  <div id="index" class="admin">
    <el-row>
      <el-col :span="3">
        <dside></dside>
      </el-col>
      <el-col :span="21">
        <atop></atop>
        <router-view></router-view>
      </el-col>
    </el-row>
    <el-backtop target=".admin"><i class="el-icon-caret-top"></i></el-backtop>
  </div>
</template>

<script>
export default {
  name: "index",
  components: {
    atop: () => import("@/components/ATop"),
    dside: () => import("@/components/DSide"),
  },
};
</script>
<style scoped>
.admin {
  height: 100vh;
  overflow-x: hidden;
}
</style>