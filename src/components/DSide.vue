<template>
  <el-menu
    default-active="1"
    class="el-menu-vertical-demo"
    background-color="#545c64"
    text-color="#fff"
  >
    <el-menu-item
      v-for="i in items"
      :key="i.id"
      :index="i.id"
      @click="to(i.id)"
      >{{ i.info }}</el-menu-item
    >
  </el-menu>
</template>
<script>
export default {
  name: "DSide",
  data() {
    return {
      items: [
        {
          id: "1",
          info: "首页",
        },
        {
          id: "2",
          info: "排班表",
        },
        {
          id: "3",
          info: "宿舍管理",
        },
        {
          id: "4",
          info: "报修信息",
        },
        {
          id: "5",
          info: "发布公告",
        },
        {
          id: "6",
          info: "个人信息",
        },
      ],
    };
  },
  methods: {
    to(i) {
      switch (i) {
        case "1":
          this.$router.replace({ path: "/DAdmin" });
          break;
        case "2":
          this.$router.replace({ path: "/Schedule" });
          break;
        case "3":
          this.$router.replace({ path: "/DManage" });
          break;
        case "4":
          this.$router.replace({ path: "/FInfo" });
          break;
        case "5":
          this.$router.replace({ path: "/Public" });
          break;
        case "6":
          this.$router.replace({ name: "dadmin", path: "/UInfo" });
          break;
        default:
          break;
      }
    },
  },
};
</script>
<style scoped>
.el-menu-vertical-demo {
  min-height: 100vh;
}
</style>