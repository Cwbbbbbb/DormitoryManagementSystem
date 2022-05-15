<template>
  <el-card>
    <div>
      <label
        >宿舍号<el-input
          id="dor"
          v-model="search_dor"
          type="text"
          placeholder="输入宿舍号"
          style="width: 200px; margin: 0 20px 20px 20px"
        ></el-input
      ></label>
      <el-button type="primary" size="medium" @click="search()">搜索</el-button>
    </div>
    <div>
      <el-button type="primary" size="medium" @click="dialogFormVisible = true"
        >新增</el-button
      >
    </div>

    <div>
      <el-table :data="currentPageData" border style="width: 100%">
        <el-table-column prop="dor" label="宿舍号"> </el-table-column>
        <el-table-column prop="gender" label="宿舍性别">
          <template slot-scope="scope">
            <el-select
              v-model="scope.row.gender"
              @change="aaa(scope.row.gender)"
            >
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column prop="num" label="宿舍人数">
          <template slot-scope="scope">
            <el-select v-model="scope.row.num" placeholder="人数">
              <el-option label="1" value="1"></el-option>
              <el-option label="2" value="2"></el-option>
              <el-option label="3" value="3"></el-option>
              <el-option label="4" value="4"></el-option>
              <el-option label="5" value="5"></el-option>
              <el-option label="6" value="6"></el-option> </el-select
          ></template>
        </el-table-column>
        <el-table-column prop="admin1" label="宿舍管理员1"> </el-table-column>
        <el-table-column prop="admin2" label="宿舍管理员2"> </el-table-column>
        <el-table-column prop="quarantine" label="隔离状态"> </el-table-column>
        <el-table-column prop="score" label="分数">
          <template slot-scope="scope">
            <el-rate v-model="scope.row.score"> </el-rate>
          </template>
        </el-table-column>
        <el-table-column fixed="right" label="操作" width="150">
          <template slot-scope="scope">
            <el-button
              @click="check_and_add_stu_to_dor(scope.row)"
              type="text"
              size="medium"
              >查看</el-button
            >
            <el-button
              @click="commit_change(scope.row)"
              type="text"
              size="medium"
              >提交</el-button
            >
            <el-button
              @click="del_dor(scope.$index, scope.row)"
              type="text"
              size="medium"
              >删除</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="pagination">
      <el-pagination
        background
        :hide-on-single-page="true"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :pager-count="7"
        :current-page="currentPage"
        :page-size="pageSize"
        layout="total, prev, pager, next, jumper"
        :total="total"
      >
      </el-pagination>
    </div>
    <el-dialog title="新增宿舍" :visible.sync="dialogFormVisible">
      <el-form :model="form" ref="adddorform" :rules="addformrules">
        <el-form-item label="宿舍号" :label-width="formLabelWidth" prop="dor">
          <el-input
            v-model="form.dor"
            autocomplete="off"
            placeholder="请输入宿舍号"
          ></el-input>
        </el-form-item>
        <el-form-item
          label="学生性别"
          :label-width="formLabelWidth"
          prop="gender"
        >
          <el-select v-model="form.gender" placeholder="性别">
            <el-option label="男" value="男"></el-option>
            <el-option label="女" value="女"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="住宿人数" :label-width="formLabelWidth" prop="num">
          <el-select v-model="form.num" placeholder="人数">
            <el-option label="1" value="1"></el-option>
            <el-option label="2" value="2"></el-option>
            <el-option label="3" value="3"></el-option>
            <el-option label="4" value="4"></el-option>
            <el-option label="5" value="5"></el-option>
            <el-option label="6" value="6"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          label="宿舍管理员1"
          :label-width="formLabelWidth"
          prop="admin1"
        >
          <el-input
            v-model="form.admin1"
            autocomplete="off"
            placeholder="请输入宿管1"
          ></el-input>
        </el-form-item>
        <el-form-item
          label="宿舍管理员2"
          :label-width="formLabelWidth"
          prop="admin2"
        >
          <el-input
            v-model="form.admin2"
            autocomplete="off"
            placeholder="请输入宿管2"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="resetadddorform()">清 空</el-button>
        <el-button type="primary" @click="confirm_insert_dor()"
          >确 定</el-button
        >
      </div>
    </el-dialog>
    <el-dialog title="查看宿舍信息" :visible.sync="dialogFormVisible2">
      <el-card v-for="(i, index) in items" :key="index">
        <div style="text-align: center">
          <el-image
            shape="square"
            :src="require('@/assets/images/avatar/' + i.img)"
            style="width: 100px; height: 100px"
          ></el-image>
        </div>
        <span><label>姓名:</label>{{ i.name }}</span>
        <span><label>学号:</label>{{ i.sid }}</span>
        <span><label>电话号码:</label>{{ i.phone }}</span>
        <span
          ><el-button
            type="danger"
            size="small"
            @click="del_stu_in_dor(index, i.sid)"
            >删除</el-button
          ></span
        >
      </el-card>
      <el-card v-show="show">
        <el-input
          v-model="student"
          style="width: 200px"
          placeholder="请输入学号"
        ></el-input>
        <el-button
          type="primary"
          size="medium"
          @click="confirm_stu_add(add_dor, student)"
          >确定</el-button
        >
      </el-card>
      <el-button v-show="items.length < num" type="primary" @click="show_add()"
        >添加</el-button
      >
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogFormVisible2 = false"
          >确 定</el-button
        >
      </div>
    </el-dialog>
  </el-card>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      dialogFormVisible: false,
      dialogFormVisible2: false,
      formLabelWidth: "120px",
      currentPageData: [],
      pageSize: 5,
      currentPage: 1,
      total: 0,
      show: false,
      value: 0,
      num: "",
      search_dor: "",
      add_dor: "",
      a: 0,
      student: "",
      form: {
        dor: "",
        num: 0,
        quarantine: "否",
        gender: "",
        admin1: "",
        admin2: "",
        electricity: 0,
      },
      dormitory: [
        {
          dor: "",
          num: 0,
          quarantine: "",
          gender: "",
          admin1: "",
          admin2: "",
          score: 0,
        },
      ],
      items: [
        {
          sid: "",
          name: "",
          phone: "",
          img: "user.jpg",
        },
      ],
      addformrules: {
        dor: [{ required: true, message: "请输入宿舍号", trigger: "blur" }],
        gender: [
          {
            required: true,
            message: "请选择住宿性别",
            trigger: ["blur", "change"],
          },
        ],
        admin1: [{ required: true, message: "请输入宿管1", trigger: "blur" }],
        admin2: [{ required: true, message: "请输入宿管2", trigger: "blur" }],
      },
    };
  },
  methods: {
    sinfo() {
      axios
        .post("http://localhost:3000/api/adorinfo")
        .then((response) => {
          this.dormitory = response.data;
          this.total = this.dormitory.length;
          this.currentPage = 1;
          this.pageSize = 10;
          this.setCurrentPageData();
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    },
    show_add() {
      this.show = true;
    },
    confirm_stu_add(dor, student) {
      axios
        .post("http://localhost:3000/api/upstudor", { dor: dor, sid: student })
        .then((response) => {
          //console.log(this.items);
        })
        .catch((error) => {
          console.log("error:" + error);
        });
      axios
        .post("http://localhost:3000/api/sinfo", { dor: dor })
        .then((response) => {
          this.items = response.data;
          this.$message({
            type: "success",
            message: "新增成功!",
          });
          //console.log(this.items);
        })
        .catch((error) => {
          console.log("error:" + error);
        });
      this.show = false;
      this.student = "";
    },
    del_stu_in_dor(index, sid) {
      this.$confirm("此操作将在该宿舍删除该数据, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          axios
            .post("http://localhost:3000/api/upstudor", { dor: null, sid: sid })
            .then((response) => {
              console.log(index);
              console.log(this.items);
            })
            .catch((error) => {
              console.log("error:" + error);
            });
          this.$message({
            type: "success",
            message: "删除成功!",
          });
          this.items.splice(index, 1);
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
    search() {
      axios
        .post("http://localhost:3000/api/searchdor", { dor: this.search_dor })
        .then((response) => {
          this.dormitory = response.data;
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    },
    admin(a) {
      axios
        .post("http://localhost:3000/api/searchadsc", { name: a })
        .then((response) => {
          //console.log(response);
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    },
    resetadddorform() {
      this.$refs.adddorform.resetFields();
    },
    confirm_insert_dor() {
      this.$refs.adddorform.validate((valid) => {
        if (valid) {
          axios
            .post("http://localhost:3000/api/insertdor", { form: this.form })
            .then((response) => {
              //console.log(this.items)
              this.dialogFormVisible = false;
            })
            .catch((error) => {
              console.log("error:" + error);
            });
          alert("新增成功！");
          this.sinfo();
        } else {
          console.log("error submit");
          return false;
        }
        //
      });
    },
    check_and_add_stu_to_dor(row) {
      this.add_dor = row.dor;
      this.num = row.num;
      axios
        .post("http://localhost:3000/api/sinfo", { dor: row.dor })
        .then((response) => {
          this.items = response.data;
          console.log(this.items);
          this.dialogFormVisible2 = true;
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    },
    del_dor(index, row) {
      this.$confirm("此操作将永久删除该数据, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          axios
            .post("http://localhost:3000/api/deldor", { dor: row.dor })
            .then((response) => {
              //console.log(this.items);
              this.sinfo();
            })
            .catch((error) => {
              console.log("error:" + error);
            });
          this.$message({
            type: "success",
            message: "删除成功!",
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
    commit_change(row) {
      axios
        .post("http://localhost:3000/api/updor", { row: row })
        .then((response) => {
          alert("提交成功!");
          //console.log(this.items);
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    },
    setCurrentPageData() {
      let begin = (this.currentPage - 1) * this.pageSize;
      let end = this.currentPage * this.pageSize;
      this.currentPageData = this.dormitory.slice(begin, end);
    },
    handleCurrentChange(val) {
      if (this.currentPage == this.totalPage) return;
      this.currentPage = val;
      this.setCurrentPageData();
    },
    handleSizeChange(val) {
      console.log(`每页 ${val} 条`);
    },
  },
  created() {
    this.sinfo();
  },
};
</script>
<style scoped>
.student {
  margin-top: 5px;
}
span {
  margin-left: 20px;
}
.pagination {
  text-align: center;
  margin-top: 10px;
}
</style>