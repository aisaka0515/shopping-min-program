<template>
    <el-dropdown>
        <span class="el-dropdown-link">
            <el-avatar shape="square" :size="40" :src="squareUrl" />
        </span>
        <template #dropdown>
            <el-dropdown-menu>
                <el-dropdown-item @click="logout">安全退出</el-dropdown-item>
            </el-dropdown-menu>
        </template>
    </el-dropdown>
</template>
    
<script setup>
import { ref } from 'vue';
import { useStore } from 'vuex';

const squareUrl = ref("https://thirdwx.qlogo.cn/mmopen/vi_32/gFgXhVibyHlz58vYPIKtOeJI4ecPkIsQxhIVXczPaO3Jcdfiaichz7MG48eic1fzibibuwrlr5dwAbqgy3EGH2Qcl0Fw/132")



const store = useStore()

const logout = () => {
    store.dispatch('logout')
}
</script>
    
<style lang="scss" scoped></style>