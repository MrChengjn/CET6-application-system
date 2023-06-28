    <template #data-columns>

      <el-table-column
        label="考试项目"
        prop="title"
      />

      <el-table-column
        label="应试对象"
        align="center"
      >
        <template v-slot="scope">
          {{ scope.row.openType | examOpenType }}
        </template>

      </el-table-column>

      <el-table-column
        label="考试时间"
        width="220px"
        align="center"
      >

        <template v-slot="scope">
          <span v-if="scope.row.timeLimit">
            {{ scope.row.startTime }} ~ {{ scope.row.endTime }}
          </span>
          <span v-else>不限时</span>
        </template>

      </el-table-column>

      <el-table-column
        label="考试总分"
        prop="totalScore"
        align="center"
      />

      <el-table-column
        label="是否可用"
        align="center"
      >

        <template v-slot="scope">
          {{ scope.row.state | stateFilter }}
        </template>

      </el-table-column>

      <el-table-column
        label="操作"
        align="center"
        width="220px"
      >
        <template v-slot="scope">
          <el-button type="warning" size="mini" icon="el-icon-edit" @click="handleUpdateExam(scope.row.id)">变更内容</el-button>
          <el-button type="primary" size="mini" icon="el-icon-user" @click="handleExamDetail(scope.row.id)">查看详情</el-button>
        </template>
      </el-table-column>

    </template>

  </data-table>

</template>

<script>
import DataTable from '@/components/DataTable'

export default {
  name: 'ExamList',
  components: { DataTable },
  data() {
    return {

      openTypes: [
        {
          value: 1,
          label: '全专业开放'
        },
        {
          value: 2,
          label: '仅供特定专业'
        }
      ],

      listQuery: {
        current: 1,
        size: 10,
        params: {
          title: ''
        }
      },

      options: {
        // 可批量操作
        multi: true,
        // 批量操作列表
        multiActions: [
          {
            value: 'delete',
            label: '删除'
          }, {
            value: 'enable',
            label: '启用'
          },
          {
            value: 'disable',
            label: '禁用'
          }
        ],
        // 列表请求URL
        listUrl: '/exam/api/exam/exam/paging',
        // 删除请求URL
        deleteUrl: '/exam/api/exam/exam/delete',
        // 删除请求URL
        stateUrl: '/exam/api/exam/exam/state',
        addRoute: 'AddExam'
      }
    }
  },
  methods: {

    handleExamDetail(examId) {
      this.$router.push({ name: 'ListExamUser', params: { examId: examId }})
    },

    handleUpdateExam(examId) {
      this.$router.push({ name: 'UpdateExam', params: { id: examId }})
    }
  }
}
</script>
