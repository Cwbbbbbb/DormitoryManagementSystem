<template>
  <div>
    <el-card>
      <div class="info">
        <el-descriptions class="margin-top" title="宿舍信息" :column="5" border>
          <template slot="extra">
            <el-button
              type="primary"
              size="small"
              @click="dialogFormVisible1 = true"
              >报修</el-button
            >

            <el-button
              type="primary"
              size="small"
              @click="dialogFormVisible2 = true"
              >缴费</el-button
            >
          </template>
          <el-descriptions-item label="宿舍号">{{
            dorinfo.dor
          }}</el-descriptions-item>
          <el-descriptions-item label="性别">{{
            dorinfo.gender
          }}</el-descriptions-item>
          <el-descriptions-item label="住宿人数">{{
            dorinfo.num
          }}</el-descriptions-item>
          <el-descriptions-item label="文明宿舍">{{
            good
          }}</el-descriptions-item>
          <el-descriptions-item label="电">{{ e }}</el-descriptions-item>
          <el-descriptions-item label="隔离状态">{{
            dorinfo.quarantine
          }}</el-descriptions-item>
        </el-descriptions>
      </div>
      <div class="fixinfo">
        <h4>报修信息</h4>
        <el-table :data="tableData" style="width: 100%">
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
          <el-table-column prop="fix" label="修理状态"> </el-table-column>
        </el-table>
      </div>
      <el-dialog title="报修" :visible.sync="dialogFormVisible1">
        <el-form :model="form" :rules="formrules" ref="fix">
          <el-form-item
            label="报修物品"
            :label-width="formLabelWidth"
            prop="stuff"
          >
            <el-input v-model="form.stuff" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="宿舍号" :label-width="formLabelWidth" prop="dor">
            <el-input v-model="form.dor" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="状态" :label-width="formLabelWidth" prop="state">
            <el-radio-group v-model="form.state">
              <el-radio label="损坏" border></el-radio>
              <el-radio label="丢失" border></el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="图片" :label-width="formLabelWidth" prop="pic">
            <el-upload
              v-model="form.pic"
              action="http://localhost:3000/api/insert_fixinfo"
              :data="form"
              name="image"
              ref="upload"
              list-type="picture-card"
              :on-preview="handlePictureCardPreview"
              :on-remove="handleRemove"
              :on-success="successUpload"
              :on-change="beforeUpload"
              :auto-upload="false"
            >
              <i class="el-icon-plus"></i>
            </el-upload>
            <el-dialog :visible.sync="dialogVisible">
              <img width="100%" :src="dialogImageUrl" alt="" />
            </el-dialog>
          </el-form-item>
          <el-form-item
            label="报修日期"
            :label-width="formLabelWidth"
            prop="fdate"
          >
            <el-date-picker
              v-model="form.fdate"
              type="datetime"
              value-format="yyyy-MM-dd HH:mm:ss"
              placeholder="选择日期"
            >
            </el-date-picker>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="handleclose('fix')">取 消</el-button>
          <el-button type="primary" @click="confirm_fixinfo_insert()"
            >确 定</el-button
          >
        </div> </el-dialog
      ><el-dialog title="缴费" :visible.sync="dialogFormVisible2">
        <el-form ref="pay">
          <el-form-item label="金额" :label-width="formLabelWidth">
            <el-input v-model="pay" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="handleclose('pay')">取 消</el-button>
          <el-button type="primary" @click="confirm2()">确 定</el-button>
        </div>
      </el-dialog>
    </el-card>
  </div>
</template>
<script>
import axios from "axios";
import { mapGetters, mapState } from "vuex";
export default {
  data() {
    return {
      dorinfo: {
        dorid: "",
        dor: "",
        num: "",
        quarantine: "",
        electricity: 0,
        gender: "",
        score: "",
      },
      good: "",
      dialogImageUrl: "",
      dialogVisible: false,
      pay: 0,
      e: 0,
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
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      formLabelWidth: "120px",
      form: {
        fdate: "",
        dor: "",
        stuff: "",
        state: "",
        remarks: "",
        pic: "",
        fix: "0",
      },
      formrules: {
        fdate: [{ required: true, message: "请选择日期", trigger: "blur" }],
        dor: [{ required: true, message: "请输入宿舍号", trigger: "blur" }],
        stuff: [{ required: true, message: "请输入物品", trigger: "blur" }],
        state: [
          {
            required: true,
            message: "请选择物品状态",
            trigger: ["blur", "change"],
          },
        ],
        pic: [
          {
            required: true,
            trigger: ["change", "blur"],
            validator: (rule, value, callback) => {
              if (this.dialogImageUrl == "") {
                callback(new Error("请上传图片"));
              } else {
                callback();
              }
            },
          },
        ],
      },
    };
  },
  computed: {
    ...mapState({
      dor: (state) => state.dor,
    }),
    ...mapGetters(["getdor"]),
  },
  methods: {
    handleclose(ref) {
      switch (ref) {
        case "fix":
          this.$refs.fix.resetFields();
          this.dialogFormVisible1 = false;
          break;
        case "pay":
          this.pay = 0;
          this.dialogFormVisible2 = false;
          break;
      }
    },
    handleRemove(file) {
      this.dialogImageUrl = "";
      console.log(file);
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    successUpload(res, file) {
      location.reload();
    },
    beforeUpload(file) {
      const typeArr = ["image/png", "image/gif", "image/jpeg", "image/jpg"];
      const isJPG = typeArr.indexOf(file.raw.type) !== -1;
      const isLt3M = file.size / 1024 / 1024 < 3;
      if (!isJPG) {
        this.$message.error("只能是图片!");
        this.$refs.upload.clearFiles();
        this.files = null;
        return;
      }
      if (!isLt3M) {
        this.$message.error("上传图片大小不能超过 3MB!");
        this.$refs.upload.clearFiles();
        this.files = null;
        return;
      }
      this.dialogImageUrl = file.url;
    },
    confirm_fixinfo_insert() {
      this.$refs["fix"].validate((valid) => {
        if (valid) {
          this.$refs.upload.submit();
          alert("添加成功!");
          this.dialogFormVisible1 = false;
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    confirm2() {
      this.e = this.e + parseInt(this.pay);
      axios
        .post("http://localhost:3000/api/recharge", {
          electricity: this.e,
          dor: this.dor,
        })
        .then((response) => {
          //console.log(this.tableData)
        })
        .catch((error) => {
          console.log("error:" + error);
        });
      this.pay = 0;
      this.dialogFormVisible2 = false;
    },
  },

  created() {
    var d = this.dor;
    this.form.dor = d;
    var time = new Date();
    var t =
      time.getFullYear() +
      "-" +
      time.getMonth() +
      "-" +
      time.getDate() +
      " " +
      time.toLocaleTimeString();
    console.log(t);
    axios
      .post("http://localhost:3000/api/dorinfo", { dor: d })
      .then((response) => {
        this.dorinfo = response.data[0];
        this.e = this.dorinfo.electricity;
        console.log(this.dorinfo);
        if (this.dorinfo.score >= 4) {
          this.good = "是";
        } else {
          this.good = "否";
        }
        this.electricity = this.dorinfo.electricity;
      })
      .catch((error) => {
        console.log("error:" + error);
      });
    axios
      .post("http://localhost:3000/api/dfixinfo", { dor: d })
      .then((response) => {
        this.tableData = response.data;
        this.tableData.forEach((element) => {
          if (element.fix == "1") {
            element.fix = "已受理";
            console.log(this.tableData);
          } else if (element.fix == "0") {
            element.fix = "未受理";
          }
        });

        //console.log(this.tableData)
      })
      .catch((error) => {
        console.log("error:" + error);
      });
  },
};
</script>
<style scoped>
.el-card {
  min-height: 80vh;
}
</style>