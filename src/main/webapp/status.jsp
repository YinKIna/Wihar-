<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>申诉状态 - MC服务器申诉系统</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 自定义CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Font Awesome图标 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- 科技感字体 -->
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@500;600;700&family=Orbitron:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- 导航栏 -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-cube me-2"></i>
                MC申诉系统
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">
                            <i class="fas fa-home me-1"></i>首页
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="submit.jsp">
                            <i class="fas fa-paper-plane me-1"></i>提交申诉
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="status.jsp">
                            <i class="fas fa-tasks me-1"></i>申诉状态
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="rules.jsp">
                            <i class="fas fa-book me-1"></i>申诉规则
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 主要内容 -->
    <div class="hero-section">
        <div class="container">
            <div class="status-card">
                <h2 class="text-center mb-4">申诉状态查询</h2>
                
                <!-- 查询表单 -->
                <div class="search-form mb-4">
                    <div class="input-group">
                        <input type="text" class="form-control" id="appealId" placeholder="请输入申诉ID">
                        <button class="btn btn-primary" type="button" onclick="searchAppeal()">
                            <i class="fas fa-search me-2"></i>查询
                        </button>
                    </div>
                </div>

                <!-- 申诉状态展示 -->
                <div class="appeal-status" id="appealStatus" style="display: none;">
                    <div class="status-header">
                        <h3 class="appeal-id">申诉ID: <span id="displayAppealId">AP123456</span></h3>
                        <div class="status-badge pending">处理中</div>
                    </div>
                    
                    <!-- 进度时间线 -->
                    <div class="timeline">
                        <div class="timeline-item completed">
                            <div class="timeline-point"></div>
                            <div class="timeline-content">
                                <h4>申诉提交</h4>
                                <p>2024-03-15 14:30</p>
                                <div class="timeline-detail">已成功提交申诉请求</div>
                            </div>
                        </div>
                        
                        <div class="timeline-item completed">
                            <div class="timeline-point"></div>
                            <div class="timeline-content">
                                <h4>审核接收</h4>
                                <p>2024-03-15 15:00</p>
                                <div class="timeline-detail">管理员已接收申诉请求</div>
                            </div>
                        </div>
                        
                        <div class="timeline-item active">
                            <div class="timeline-point"></div>
                            <div class="timeline-content">
                                <h4>处理中</h4>
                                <p>2024-03-15 15:30</p>
                                <div class="timeline-detail">正在审核您的申诉内容</div>
                            </div>
                        </div>
                        
                        <div class="timeline-item">
                            <div class="timeline-point"></div>
                            <div class="timeline-content">
                                <h4>处理完成</h4>
                                <p>等待处理</p>
                                <div class="timeline-detail">-</div>
                            </div>
                        </div>
                    </div>

                    <!-- 申诉详情 -->
                    <div class="appeal-details">
                        <h4><i class="fas fa-info-circle me-2"></i>申诉详情</h4>
                        <div class="detail-grid">
                            <div class="detail-item" data-label="游戏ID">
                                <span class="detail-label">游戏ID</span>
                                <span class="detail-value">Player123</span>
                            </div>
                            <div class="detail-item" data-label="处罚类型">
                                <span class="detail-label">处罚类型</span>
                                <span class="detail-value">封禁</span>
                            </div>
                            <div class="detail-item" data-label="提交时间">
                                <span class="detail-label">提交时间</span>
                                <span class="detail-value">2024-03-15 14:30</span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">预计完成</span>
                                <span class="detail-value">24小时内</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 无结果提示 -->
                <div class="no-result" id="noResult" style="display: none;">
                    <i class="fas fa-search me-2"></i>
                    未找到相关申诉记录
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- 查询脚本 -->
    <script>
        // 格式化时间函数
        function formatDate(dateString) {
            const date = new Date(dateString);
            return date.toLocaleString('zh-CN', {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit',
                hour: '2-digit',
                minute: '2-digit'
            });
        }

        // 更新时间线
        function updateTimeline(timeline) {
            const timelineContainer = document.querySelector('.timeline');
            timelineContainer.innerHTML = timeline.map((item, index) => `
                <div class="timeline-item ${index === timeline.length - 1 ? 'active' : 'completed'}">
                    <div class="timeline-point"></div>
                    <div class="timeline-content">
                        <h4>${item.step}</h4>
                        <p>${formatDate(item.time)}</p>
                        <div class="timeline-detail">${item.detail}</div>
                    </div>
                </div>
            `).join('');
        }

        function searchAppeal() {
            const appealId = document.getElementById('appealId').value;
            const appealStatus = document.getElementById('appealStatus');
            const noResult = document.getElementById('noResult');
            
            // 从localStorage获取申诉数据
            const appeals = JSON.parse(localStorage.getItem('appeals') || '[]');
            const appeal = appeals.find(a => a.id === appealId);
            
            if (appeal) {
                appealStatus.style.display = 'block';
                noResult.style.display = 'none';
                
                // 更新申诉信息
                document.getElementById('displayAppealId').textContent = appeal.id;
                document.querySelector('.status-badge').textContent = 
                    appeal.status === 'pending' ? '处理中' : '已完成';
                
                // 更新详情
                document.querySelector('[data-label="游戏ID"] .detail-value')
                    .textContent = appeal.gameId;
                document.querySelector('[data-label="处罚类型"] .detail-value')
                    .textContent = appeal.punishType;
                document.querySelector('[data-label="提交时间"] .detail-value')
                    .textContent = formatDate(appeal.submitTime);
                
                // 更新时间线
                updateTimeline(appeal.timeline);
            } else {
                appealStatus.style.display = 'none';
                noResult.style.display = 'block';
            }
        }

        // 页面加载时检查URL参数
        window.addEventListener('load', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const appealId = urlParams.get('id');
            if (appealId) {
                document.getElementById('appealId').value = appealId;
                searchAppeal();
            }
        });
    </script>
</body>
</html> 