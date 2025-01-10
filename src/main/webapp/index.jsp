<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MC服务器申诉系统</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 自定义CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Font Awesome图标 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- 添加新的科技感字体 -->
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@500;600;700&family=Orbitron:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- 导航栏 -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-cube me-2"></i>  <!-- Font Awesome图标 -->
                MC申诉系统
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">
                            <i class="fas fa-home me-1"></i>首页
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="submit.jsp">
                            <i class="fas fa-paper-plane me-1"></i>提交申诉
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="status.jsp">
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
        <!-- 添加动态粒子背景 -->
        <div class="particles-container">
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>
        <!-- 添加动态网格 -->
        <div class="grid-overlay"></div>
        <!-- 添加光晕效果 -->
        <div class="glow-effect"></div>
        <div class="container">
            <div class="row justify-content-center align-items-center min-vh-100">
                <div class="col-md-8 text-center">
                    <h1 class="minecraft-text">欢迎来到MC申诉系统</h1>
                    <p class="lead">这里是您解决游戏问题的地方</p>
                    <div class="d-grid gap-3 d-md-flex justify-content-center mt-4">
                        <a href="submit.jsp" class="btn btn-primary btn-lg px-4 me-md-2">提交申诉</a>
                        <a href="rules.jsp" class="btn btn-outline-secondary btn-lg px-4">查看规则</a>
                    </div>
                </div>
            </div>
            <!-- 特色卡片部分 -->
            <div class="row justify-content-center mt-5 feature-cards">
                <div class="col-md-4 mb-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <h3 class="card-title">快速处理</h3>
                            <p class="card-text">我们承诺在24小时内处理您的申诉请求，让您尽快回到游戏中。</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-user-shield"></i>
                            </div>
                            <h3 class="card-title">公平公正</h3>
                            <p class="card-text">专业的管理团队，确保每一个申诉都得到公平、公正的处理。</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-history"></i>
                            </div>
                            <h3 class="card-title">进度追踪</h3>
                            <p class="card-text">实时跟踪申诉处理进度，随时了解您的申诉状态。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 添加导航栏滚动效果脚本 -->
    <script>
        let lastScrollTop = 0;
        const navbar = document.querySelector('.navbar');
        
        window.addEventListener('scroll', () => {
            let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            if (scrollTop > 50) {
                navbar.classList.add('navbar-scrolled');
            } else {
                navbar.classList.remove('navbar-scrolled');
            }
            
            if (scrollTop > lastScrollTop && scrollTop > 200) {
                navbar.classList.remove('navbar-show');
                navbar.classList.add('navbar-hide');
            } else {
                navbar.classList.remove('navbar-hide');
                navbar.classList.add('navbar-show');
            }
            
            lastScrollTop = scrollTop;
        });
    </script>
</body>
</html>