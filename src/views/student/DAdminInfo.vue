<template>
  <div>
    <el-card>
      <div class="info" v-for="i in admininfo" :key="i.index">
        <el-image
          shape="square"
          :src="require('@/assets/images/avatar/'+ i.img)"
          style="width: 100px; height: 100px; margin: 0 auto"
        ></el-image>
        <el-descriptions class="margin-top" :column="4">
          <el-descriptions-item label="姓名">{{ i.name }}</el-descriptions-item>
          <el-descriptions-item label="性别">{{i.gender}}</el-descriptions-item>
          <el-descriptions-item label="宿舍号">{{i.dor}}</el-descriptions-item>
          <el-descriptions-item label="手机号">{{i.phone}}</el-descriptions-item>
        </el-descriptions>
        <div class="schedule">
          <h3>排班表</h3>
          <el-table :data="i.tableData" border style="width: 100%">
            <el-table-column prop="weeks" label="周次"> </el-table-column>
            <el-table-column prop="Mon" label="周一"> </el-table-column>
            <el-table-column prop="Tue" label="周二"> </el-table-column>
            <el-table-column prop="Wen" label="周三"> </el-table-column>
            <el-table-column prop="Thu" label="周四"> </el-table-column>
            <el-table-column prop="Fri" label="周五"> </el-table-column>
            <el-table-column prop="Sat" label="周六"> </el-table-column>
            <el-table-column prop="Sun" label="周日"> </el-table-column>
          </el-table>
        </div>
      </div>
    </el-card>
  </div>
</template>
<script>
import { mapGetters, mapState } from "vuex";
import axios from "axios";
export default {
  data() {
    return {
      aUrl:
        "https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png",
      Data1: [
        {
          weeks: "1,3,5,7,9,11,13,15,17,19",
          Mon: "6:00-18:00",
          Tue: "6:00-18:00",
          Wen: "6:00-18:00",
          Thu: "6:00-18:00",
          Fri: "6:00-18:00",
          Sat: "6:00-18:00",
          Sun: "6:00-18:00",
        },
        {
          weeks: "2,4,6,8,10,12,14,16,18,20",
          Mon: "18:00-6:00",
          Tue: "18:00-6:00",
          Wen: "18:00-6:00",
          Thu: "18:00-6:00",
          Fri: "18:00-6:00",
          Sat: "18:00-6:00",
          Sun: "18:00-6:00",
        },
      ],
      Data2: [
        {
          weeks: "1,3,5,7,9,11,13,15,17,19",
          Mon: "18:00-6:00",
          Tue: "18:00-6:00",
          Wen: "18:00-6:00",
          Thu: "18:00-6:00",
          Fri: "18:00-6:00",
          Sat: "18:00-6:00",
          Sun: "18:00-6:00",
        },
        {
          weeks: "2,4,6,8,10,12,14,16,18,20",
          Mon: "6:00-18:00",
          Tue: "6:00-18:00",
          Wen: "6:00-18:00",
          Thu: "6:00-18:00",
          Fri: "6:00-18:00",
          Sat: "6:00-18:00",
          Sun: "6:00-18:00",
        },
      ],
      admininfo: [
        {
          aid: "",
          name: "",
          gender: "",
          dor: "",
          phone: "",
          img: "",
          tableData: [],
        },
      ],
    };
  },
  computed: {
    ...mapState({
      dor: (state) => state.dor,
    }),
    ...mapGetters(["getdor"]),
  },
  created() {
    axios
      .post("http://localhost:3000/api/admin1", { dor: this.dor })
      .then((response) => {
        this.admininfo[0] = response.data[0];
        if (response.data[0].schedule == "1") {
          this.admininfo[0].tableData = this.Data1;
        } else if (response.data[0].schedule == "2") {
          this.admininfo[0].tableData = this.Data2;
        }
        //console.log(this.admininfo[0])
        this.$forceUpdate();
      })
      .catch((error) => {
        console.log("error:" + error);
      });
    axios
      .post("http://localhost:3000/api/admin2", { dor: this.dor })
      .then((response) => {
        this.admininfo[1] = response.data[0];
        if (response.data[0].schedule == "1") {
          this.admininfo[1].tableData = this.Data1;
        } else if (response.data[0].schedule == "2") {
          this.admininfo[1].tableData = this.Data2;
        }
        this.$forceUpdate();
        //console.log(this.admininfo)
      })
      .catch((error) => {
        console.log("error:" + error);
      });
  },
};
</script>
<style scoped>
.info {
  text-align: center;
  margin-top: 50px;
}
</style>