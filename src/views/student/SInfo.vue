<template>
  <div>
    <el-card>
      <el-card class="show" v-for="i in items" :key="i.index">
        <div style="text-align: center">
          <el-image
            shape="square"
            :src="require('@/assets/images/avatar/' + i.img)"
            style="width: 100px; height: 100px"
          ></el-image>
        </div>
        <p><label>姓名:</label>{{ i.name }}</p>
        <p><label>性别:</label>{{ i.gender }}</p>
        <p><label>学号:</label>{{ i.sid }}</p>
        <p><label>宿舍号:</label>{{ i.dor }}</p>
        <p><label>电话号码:</label>{{ i.phone }}</p>
        <div style="text-align: center">
          <el-button size="medium" @click="health(i.sid)">健康上报</el-button>
        </div> </el-card
      ><el-dialog title="健康上报" :visible.sync="dialogFormVisible">
        <el-form :model="form" :rules="healthrules" ref="healthform">
          <el-form-item
            label="当前所在地"
            :label-width="formLabelWidth"
            prop="location"
          >
            <el-select placeholder="当前所在地" v-model="form.location">
              <el-option
                label="广州市（校内）"
                value="广州市（校内）"
              ></el-option>
              <el-option
                label="广州市（校外）"
                value="广州市（校外）"
              ></el-option>
              <el-option label="广州市外" value="广州市外"></el-option>
              <el-option label="广东省外" value="广东省外"></el-option>
              <el-option label="港澳台" value="港澳台"></el-option>
              <el-option label="国外" value="国外"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item
            label="本人及同住人员身体状况"
            :label-width="formLabelWidth"
            prop="health"
          >
            <el-select placeholder="身体状况" v-model="form.health">
              <el-option label="均无异常" value="均无异常"></el-option>
              <el-option
                label="乏力/发热/干咳/腹泻/流鼻涕/头痛"
                value="乏力/发热/干咳/腹泻/流鼻涕/头痛"
              ></el-option>
              <el-option
                label="同住人员乏力/发热/干咳/腹泻/流鼻涕/头痛"
                value="同住人员乏力/发热/干咳/腹泻/流鼻涕/头痛"
              ></el-option>
              <el-option
                label="均出现乏力/发热/干咳/腹泻/流鼻涕/头痛"
                value="均出现乏力/发热/干咳/腹泻/流鼻涕/头痛"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item
            label="是否处于管控区域"
            :label-width="formLabelWidth"
            prop="control"
          >
            <el-select placeholder="是否处于管控区域" v-model="form.control">
              <el-option label="是" value="是"></el-option>
              <el-option label="否" value="否"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item
            label="健康码"
            :label-width="formLabelWidth"
            prop="QRcode"
          >
            <el-select placeholder="健康码" v-model="form.QRcode">
              <el-option label="红码" value="红码"></el-option>
              <el-option label="黄码" value="黄码"></el-option>
              <el-option label="绿码" value="绿码"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="上传健康码" :label-width="formLabelWidth" prop="pic">
                <el-upload
                  action="http://localhost:3000/api/health"
                  name="image"
                  v-model="form.pic"
                  :data="form"
                  ref="upload"
                  enctype="multipart/form-data"
                  list-type="picture-card"
                  :on-preview="handlePictureCardPreview"
                  :on-remove="handleRemove"
                  :on-success="successUpload"
                  :on-change="beforeUpload"
                  :auto-upload="false"
                  :limit="1"
                >
                  <i class="el-icon-plus"></i>
                </el-upload>
                <el-dialog :visible.sync="dialogVisible">
                  <img width="100%" :src="dialogImageUrl" alt="" />
                </el-dialog>
              </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="handleclose">取 消</el-button>
          <el-button type="primary" @click="confirm()">确 定</el-button>
        </div>
      </el-dialog>
    </el-card>
  </div>
</template>
<script>
import { mapGetters, mapState } from "vuex";
import axios from "axios";
export default {
  data() {
    return {
      dialogFormVisible: false,
      formLabelWidth: "180px",
      items: [
        {
          sid: "",
          gender: "",
          name: "",
          phone: "",
          dor: "",
          img: "",
        },
      ],
      form: {
        sid: "",
        health: "",
        location: "",
        control: "",
        QRcode: "",
        date: "",
        pic:"",
      },
      healthrules: {
        health: [
          {
            required: true,
            message: "请选择健康状况",
            trigger: ["blur", "change"],
          },
        ],
        location: [
          {
            required: true,
            message: "请选择所在地",
            trigger: ["blur", "change"],
          },
        ],
        control: [
          {
            required: true,
            message: "请选择是否处于管控区域",
            trigger: ["blur", "change"],
          },
        ],
        QRcode: [
          {
            required: true,
            message: "请选择健康码",
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
  methods: {
    handleclose() {
      this.$refs.healthform.resetFields();
      this.dialogFormVisible = false;
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
    health(i) {
      this.form.sid = i;
      this.dialogFormVisible = true;
    },
    confirm() {
      console.log(this.$refs.healthform);
      this.$refs.healthform.validate((valid) => {
        if (valid) {
          var date = new Date();
          this.form.date = date.toLocaleDateString();
          this.$refs.upload.submit()
          alert("上报成功!");
          this.$refs.healthform.resetFields();
          this.dialogFormVisible = false;
        } else {
          console.log("error submit!!");
          return false;
        }
      });
      console.log(this.form);
    },
  },
  computed: {
    ...mapState({
      dor: (state) => state.dor,
    }),
    ...mapGetters(["getdor"]),
  },
  created() {
    axios
      .post("http://localhost:3000/api/sinfo", { dor: this.dor })
      .then((response) => {
        this.items = response.data;
        //console.log(this.items)
      })
      .catch((error) => {
        console.log("error:" + error);
      });
  },
};
</script>
<style>
.show {
  display: inline-block;
  margin-left: 100px;
  width: 300px;
}
label {
  display: inline-block;
  width: 100px;
  text-align: right;
}
</style>