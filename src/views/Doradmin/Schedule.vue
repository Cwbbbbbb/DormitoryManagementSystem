<template>
  <el-card>
    <div>
      <label
        >宿管姓名<el-input
          type="text"
          v-model="s"
          placeholder="宿管姓名"
          style="width: 200px; margin: 0 20px 0 20px"
        ></el-input
      ></label>
      <el-button type="primary" size="medium" @click="search()">搜索</el-button>
    </div>
    <div class="schedule">
      <h3>排班表</h3>
      <el-table :data="tableData" border style="width: 100%">
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
  </el-card>
</template>
<script>
import { mapGetters, mapState } from "vuex";
import axios from "axios";
export default {
  data() {
    return {
      s: "",
      tableData: [
        {
          weeks: "",
          Mon: "",
          Tue: "",
          Wen: "",
          Thu: "",
          Fri: "",
          Sat: "",
          Sun: "",
        },
      ],
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
    };
  },
  methods: {
    search() {
      let n = this.s;
      axios
        .post("http://localhost:3000/api/searchadsc", { name: n })
        .then((response) => {
          console.log(response);
          if (response.data != null) {
            if (response.data[0].schedule == "1") {
              this.tableData = this.Data1;
            } else if (response.data[0].schedule == "2") {
              this.tableData = this.Data2;
            }
          } else {
            alert("找不到此人");
          }
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    },
  },
  computed: {
    ...mapState({
      loginid: (state) => state.loginid,
    }),
    ...mapGetters(["getloginid"]),
  },
  created() {
    axios
      .post("http://localhost:3000/api/admininfo", { aid: this.loginid })
      .then((response) => {
        if (response.data[0].schedule == "1") {
          this.tableData = this.Data1;
        } else if (response.data[0].schedule == "2") {
          this.tableData = this.Data2;
        }
        //console.log(response.data[0])
        this.s = response.data[0].name;
      })
      .catch((error) => {
        console.log("error:" + error);
      });
  },
};
</script>