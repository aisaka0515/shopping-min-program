<template>
    <el-card>
        <el-row :gutter="20" class="header">
            <el-col :span="7">
                <el-input placeholder="请输入商品小类名称..." clearable vmodel="queryForm.query"></el-input>
            </el-col>
            <el-button type="primary" :icon="Search" @click="initSmallTypeList">搜索
            </el-button>
            <el-button type="primary" :icon="DocumentAdd" @click="handleDialogValue()">添加商品小类</el-button>

        </el-row>
        <el-table :data="tableData" stripe style="width: 100%">
            <el-table-column prop="id" label="#ID" width="80" />
            <el-table-column prop="name" label="商品小类名称" width="200" />
            <el-table-column prop="bigType" label="所属大类" width="200" :formatter="bigTypeNameFormatter" />
            <el-table-column prop="remark" label="商品小类描述" />
            <el-table-column prop="action" label="操作" width="300">
                <template v-slot="scope">
                    <el-button type="primary" :icon="Edit" @click="handleDialogValue(scope.row.id)"></el-button>
                    <el-button type="danger" :icon="Delete" @click="handleDelete(scope.row.id)"></el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination v-model:currentPage="queryForm.pageNum" v-model:page-size="queryForm.pageSize"
            :page-sizes="[10, 20, 30, 40, 50]" layout="total, sizes, prev, pager, next, jumper" :total="total"
            @size-change="handleSizeChange" @current-change="handleCurrentChange" />
    </el-card>
    <Dialog v-model="dialogVisible" :dialogVisible="dialogVisible" :dialogTitle="dialogTitle" :id="id"
        @initSmallTypeList="initSmallTypeList">
    </Dialog>
</template>
<script setup>
import { Search, Delete, Edit } from '@element-plus/icons-vue'
import { ref } from 'vue'
import axios from "@/util/axios";
import { ElMessageBox, ElMessage } from 'element-plus'
import Dialog from './components/dialog.vue'
const queryForm = ref({
    query: '',
    pageNum: 1,
    pageSize: 10
})
const total = ref(0)
const tableData = ref([])
const id = ref(-1)
const dialogVisible = ref(false)
const dialogTitle = ref('')
const handleDialogValue = (smallTypeId) => {

    if(smallTypeId){
        id.value=smallTypeId;
        dialogTitle.value="商品大类修改"
    }else{
        id.value=-1;
        dialogTitle.value="商品大类添加"
    }
    dialogVisible.value = true
    id.value = smallTypeId;
}
const initSmallTypeList = async () => {
    const res = await axios.post("admin/smallType/list", queryForm.value);
    tableData.value = res.data.smallTypeList;
    total.value = res.data.total;
}
initSmallTypeList();

const handleSizeChange = (pageSize) => {
    queryForm.value.pageNum = 1;
    queryForm.value.pageSize = pageSize;
    initSmallTypeList();
}
const handleCurrentChange = (pageNum) => {
    queryForm.value.pageNum = pageNum;
    initSmallTypeList();
}
const bigTypeNameFormatter = (row) => {
    return row.bigType.name
}
const handleDelete = (id) => {
    ElMessageBox.confirm(
        '您确定要删除这条记录吗？',
        '系统提示',
        {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning',
        }
    )
        .then(async () => {
            let res = await axios.get('admin/smallType/delete/' + id)
            if (res.data.code == 0) {
                ElMessage({
                    type: 'success',
                    message: '删除成功',
                })
                initSmallTypeList();
            } else {
                ElMessage({
                    type: 'error',
                    message: res.data.msg,
                })
            }
        })
        .catch(() => {
        })
}
</script>
<style lang="scss" scoped>
.header {
    padding-bottom: 16px;
    box-sizing: border-box;
}

.el-pagination {
    padding-top: 15px;
    box-sizing: border-box;
}
</style>
    