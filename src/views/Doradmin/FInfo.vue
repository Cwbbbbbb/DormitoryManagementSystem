<template>
  <el-card>
    <div>
      <label
        >宿舍号<el-input
          type="text"
          v-model="d"
          placeholder="输入宿舍号"
          style="width: 200px; margin: 0 20px 20px 20px"
        ></el-input
      ></label>
      <el-button type="primary" size="medium" @click="search()">搜索</el-button>
    </div>
    <div class="fixinfo">
      <h4>报修信息</h4>
      <el-table :data="currentPageData" style="width: 100%">
        <el-table-column prop="fdate" label="日期"> </el-table-column>
        <el-table-column prop="dor" label="宿舍"> </el-table-column>
        <el-table-column prop="stuff" label="物品"> </el-table-column>
        <el-table-column prop="state" label="状态"> </el-table-column>
        <el-table-column prop="pic" label="图片">
          <template slot-scope="scope">
            <el-image
              :src="require('@/assets/images/fiximg/' + scope.row.pic)"
              alt=""
              style="width: 100px; height: 100px"
            ></el-image>
          </template>
        </el-table-column>
        <el-table-column prop="remarks" label="备注"> </el-table-column>
        <el-table-column prop="fix" label="修理状态">
          <template slot-scope="scope">
            <el-switch
              style="display: block; width: 300px"
              v-model="scope.row.fix"
              @change="change(scope.row.fix, scope.row.dor)"
              active-color="#13ce66"
              inactive-color="#ff4949"
              active-text="已受理"
              inactive-text="未受理"
            >
            </el-switch>
          </template>
        </el-table-column>
        <!-- <el-table-column
      fixed="right"
      label="操作"
      width="150">
      <template slot-scope="scope">
        <el-button @click="change(scope.row)" type="text" size="medium">修改</el-button>
      </template>
    </el-table-column> -->
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
    <!-- <el-dialog title="修改" :visible.sync="dialogFormVisible">
         <el-select v-model="tableData.state" placeholder="修改状态">
           <el-option label="未受理" value="未受理"></el-option>
           <el-option label="已受理" value="已受理"></el-option>
         </el-select>
         <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="confirm()">确 定</el-button>
          </div>
       </el-dialog> -->
  </el-card>
</template>
<script>
import axios from "axios";
export default {
  data() {
    return {
      dialogFormVisible: false,
      d: "",
      currentPageData: [],
      pageSize: 5,
      currentPage: 1,
      total: 0,
      tableData: [
        {
          fid: "",
          fdate: "",
          dor: "",
          stuff: "",
          state: "",
          pic: "",
          remarks: "",
          fix: "",
        },
      ],
    };
  },
  methods: {
    /* confirm() {
      this.dialogFormVisible = false;
    }, */
    change(fix, dor) {
      /* this.dialogFormVisible = true; */
      axios
        .post("http://localhost:3000/api/updatefix", { fix: fix, dor: dor })
        .then((response) => {
          /* this.tableData = response.data; */
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    },
    search() {
      axios
        .post("http://localhost:3000/api/searchfix", { dor: this.d })
        .then((response) => {
          this.tableData = response.data;
        })
        .catch((error) => {
          console.log("error:" + error);
        });
    },
    setCurrentPageData() {
      let begin = (this.currentPage - 1) * this.pageSize;
      let end = this.currentPage * this.pageSize;
      this.currentPageData = this.tableData.slice(begin, end);
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
    axios
      .post("http://localhost:3000/api/fixinfo")
      .then((response) => {
        this.tableData = response.data;
        this.tableData.forEach((element) => {
          if (element.fix == "1") {
            element.fix = true;
          } else if (element.fix == "0") {
            element.fix = false;
          }
          this.total = this.tableData.length;
          this.currentPage = 1;
          this.pageSize = 10;
          this.setCurrentPageData();
        });
      })
      .catch((error) => {
        console.log("error:" + error);
      });
  },
};
</script>
<style scoped>
.pagination {
  text-align: center;
  margin-top: 10px;
}
</style>