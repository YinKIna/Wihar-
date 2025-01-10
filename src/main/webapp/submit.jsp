<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>提交申诉 - MC服务器申诉系统</title>
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
    <!-- 导航栏 (与index.jsp相同) -->
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
                        <a class="nav-link active" href="submit.jsp">
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
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="submit-form-card">
                        <h2 class="text-center mb-4">提交申诉</h2>
                        <!-- 步骤指示器 -->
                        <div class="step-indicator mb-4">
                            <div class="step-progress-bar"></div>
                            <div class="step active" data-step="1">
                                <div class="step-number">1</div>
                                <div class="step-title">基本信息</div>
                            </div>
                            <div class="step" data-step="2">
                                <div class="step-number">2</div>
                                <div class="step-title">处罚信息</div>
                            </div>
                            <div class="step" data-step="3">
                                <div class="step-number">3</div>
                                <div class="step-title">申诉说明</div>
                            </div>
                        </div>

                        <form class="appeal-form" id="appealForm">
                            <!-- 表单步骤 -->
                            <div class="form-steps">
                                <!-- 步骤1：基本信息 -->
                                <div class="form-step active" id="step1">
                                    <div class="mb-4">
                                        <label class="form-label">游戏ID</label>
                                        <input type="text" class="form-control" name="gameId" required
                                            pattern="^[a-zA-Z0-9_]{3,16}$"
                                            title="请输入3-16位的字母、数字或下划线">
                                        <div class="form-text">请输入您的Minecraft游戏ID</div>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label">QQ号码</label>
                                        <input type="text" class="form-control" name="qq" required
                                            pattern="^[1-9][0-9]{4,10}$"
                                            title="请输入正确的QQ号码">
                                        <div class="form-text">用于接收申诉处理结果</div>
                                    </div>
                                </div>

                                <!-- 步骤2：处罚信息 -->
                                <div class="form-step" id="step2">
                                    <div class="mb-4">
                                        <label class="form-label">处罚类型</label>
                                        <select class="form-select" name="punishType" required>
                                            <option value="">请选择处罚类型</option>
                                            <option value="ban">封禁账号</option>
                                            <option value="mute">禁言处罚</option>
                                            <option value="warn">警告处分</option>
                                            <option value="other">其他处罚</option>
                                        </select>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label">处罚时间</label>
                                        <input type="datetime-local" class="form-control" name="punishTime" required
                                            max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new java.util.Date()) %>">
                                        <div class="form-text">处罚发生的大致时间</div>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label">处罚原因</label>
                                        <input type="text" class="form-control" name="punishReason" required
                                            minlength="2" maxlength="100">
                                        <div class="form-text">如果不知道具体原因可以填写"未知"</div>
                                    </div>
                                </div>

                                <!-- 步骤3：申诉说明 -->
                                <div class="form-step" id="step3">
                                    <div class="mb-4">
                                        <label class="form-label">申诉理由</label>
                                        <textarea class="form-control" name="appealReason" rows="6" required
                                            minlength="20" maxlength="1000"></textarea>
                                        <div class="form-text">请详细说明您的申诉理由（20-1000字）</div>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label">证据上传</label>
                                        <div class="upload-area">
                                            <input type="file" class="form-control" name="evidence" 
                                                multiple accept="image/*,video/*">
                                            <div class="upload-preview"></div>
                                        </div>
                                        <div class="form-text">支持图片、视频等格式，单个文件最大20MB</div>
                                    </div>
                                    <div class="mb-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" required
                                                name="agreement" id="agreement">
                                            <label class="form-check-label" for="agreement">
                                                我已阅读并同意《申诉规则》，保证所填信息真实有效
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 按钮组 -->
                            <div class="form-buttons mt-4">
                                <button type="button" id="prevBtn" class="btn btn-outline-secondary btn-lg" style="display: none;">上一步</button>
                                <button type="button" id="nextBtn" class="btn btn-primary btn-lg">下一步</button>
                                <button type="submit" id="submitBtn" class="btn btn-primary btn-lg" style="display: none;">提交申诉</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- 导航栏滚动效果 -->
    <script>
        let lastScrollTop = 0;
        const navbar = document.querySelector('.navbar');
        
        window.addEventListener('scroll', () => {
            let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            // 添加滚动样式
            if (scrollTop > 50) {
                navbar.classList.add('navbar-scrolled');
            } else {
                navbar.classList.remove('navbar-scrolled');
            }
            
            // 控制导航栏显示/隐藏
            if (scrollTop > lastScrollTop && scrollTop > 200) {
                // 向下滚动
                navbar.classList.remove('navbar-show');
                navbar.classList.add('navbar-hide');
            } else {
                // 向上滚动
                navbar.classList.remove('navbar-hide');
                navbar.classList.add('navbar-show');
            }
            
            lastScrollTop = scrollTop;
        });
    </script>

    <!-- 新的JavaScript代码 -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // 获取所有需要的元素
        const form = document.getElementById('appealForm');
        const steps = document.querySelectorAll('.form-step');
        const indicators = document.querySelectorAll('.step');
        const nextBtn = document.getElementById('nextBtn');
        const prevBtn = document.getElementById('prevBtn');
        const submitBtn = document.getElementById('submitBtn');
        
        let currentStep = 1;
        const totalSteps = steps.length;

        // 显示指定步骤
        function showStep(stepNumber) {
            // 隐藏所有步骤
            steps.forEach(step => step.classList.remove('active'));
            indicators.forEach(indicator => indicator.classList.remove('active'));
            
            // 显示当前步骤
            steps[stepNumber - 1].classList.add('active');
            indicators[stepNumber - 1].classList.add('active');
            
            // 更新按钮状态
            prevBtn.style.display = stepNumber === 1 ? 'none' : 'block';
            nextBtn.style.display = stepNumber === totalSteps ? 'none' : 'block';
            submitBtn.style.display = stepNumber === totalSteps ? 'block' : 'none';
            
            // 更新当前步骤
            currentStep = stepNumber;
        }

        // 添加实时验证
        document.querySelectorAll('.form-control, .form-select').forEach(input => {
            input.addEventListener('input', function() {
                validateInput(this);
            });
        });

        // 验证单个输入
        function validateInput(input) {
            let isValid = true;
            const value = input.value.trim();
            
            // 清除之前的错误状态
            input.classList.remove('is-invalid');
            hideError(input);
            
            // 跳过特殊类型的长度验证
            const skipLengthValidation = input.type === 'datetime-local' || 
                                        input.type === 'checkbox' ||
                                        input.type === 'file';
            
            // 处理checkbox的验证
            if (input.type === 'checkbox' && input.hasAttribute('required')) {
                if (!input.checked) {
                    isValid = false;
                    showError(input, '请阅读并同意申诉规则');
                }
            } else if (input.hasAttribute('required') && !value) {
                isValid = false;
                showError(input, '此字段为必填项');
            } else if (input.pattern && value) {
                const regex = new RegExp(input.pattern);
                if (!regex.test(value)) {
                    isValid = false;
                    showError(input, input.title || '输入格式不正确');
                }
            } else if (!skipLengthValidation && input.minLength && value.length < input.minLength) {
                isValid = false;
                showError(input, `内容长度不能少于 ${input.minLength} 个字符`);
            } else if (!skipLengthValidation && input.maxLength && value.length > input.maxLength) {
                isValid = false;
                showError(input, `内容长度不能超过 ${input.maxLength} 个字符`);
            }
            
            // 特殊验证：处罚时间
            if (input.type === 'datetime-local') {
                const selectedDate = new Date(value);
                const now = new Date();
                if (selectedDate > now) {
                    isValid = false;
                    showError(input, '处罚时间不能晚于当前时间');
                }
            }
            
            if (!isValid) {
                input.classList.add('is-invalid');
                input.classList.add('shake');
                setTimeout(() => {
                    input.classList.remove('shake');
                }, 500);
            }
            
            return isValid;
        }

        // 验证当前步骤
        function validateCurrentStep() {
            const currentStepElement = steps[currentStep - 1];
            const inputs = currentStepElement.querySelectorAll('input[required], select[required], textarea[required]');
            let isValid = true;

            inputs.forEach(input => {
                if (!validateInput(input)) {
                    isValid = false;
                }
            });

            return isValid;
        }

        // 显示错误信息
        function showError(input, message) {
            let errorDiv = input.parentElement.querySelector('.invalid-feedback');
            if (!errorDiv) {
                errorDiv = document.createElement('div');
                errorDiv.className = 'invalid-feedback';
                input.parentElement.appendChild(errorDiv);
            }
            errorDiv.textContent = message;
        }

        // 隐藏错误信息
        function hideError(input) {
            const errorDiv = input.parentElement.querySelector('.invalid-feedback');
            if (errorDiv) {
                errorDiv.remove();
            }
        }

        // 下一步按钮点击事件
        nextBtn.addEventListener('click', function(e) {
            e.preventDefault();
            console.log('点击下一步按钮');
            
            if (validateCurrentStep()) {
                console.log('验证通过，当前步骤:', currentStep);
                showStep(currentStep + 1);
                console.log('切换到步骤:', currentStep + 1);
            }
        });

        // 上一步按钮点击事件
        prevBtn.addEventListener('click', function(e) {
            e.preventDefault();
            showStep(currentStep - 1);
        });

        // 表单提交事件
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            if (validateCurrentStep()) {
                // 生成申诉ID
                const appealId = 'AP' + Date.now().toString().slice(-6);
                
                // 收集表单数据
                const formData = new FormData(form);
                const appealData = {
                    id: appealId,
                    gameId: formData.get('gameId'),
                    qq: formData.get('qq'),
                    punishType: formData.get('punishType'),
                    punishTime: formData.get('punishTime'),
                    appealReason: formData.get('appealReason'),
                    status: 'pending',
                    submitTime: new Date().toISOString(),
                    timeline: [
                        {
                            step: '申诉提交',
                            time: new Date().toISOString(),
                            detail: '已成功提交申诉请求'
                        }
                    ]
                };
                
                // 保存到localStorage
                const appeals = JSON.parse(localStorage.getItem('appeals') || '[]');
                appeals.push(appealData);
                localStorage.setItem('appeals', JSON.stringify(appeals));
                
                // 显示成功动画
                const successAnimation = document.getElementById('successAnimation');
                successAnimation.style.display = 'flex';
                requestAnimationFrame(() => {
                    successAnimation.classList.add('show');
                });
                
                // 显示申诉ID
                document.querySelector('.success-message').innerHTML = 
                    `您的申诉ID为: <strong>${appealId}</strong><br>请保存此ID以便查询进度`;
                
                setTimeout(() => {
                    successAnimation.classList.add('fade-out');
                    setTimeout(() => {
                        window.location.href = 'status.jsp';
                    }, 500);
                }, 3000);
            }
        });

        // 初始化表单
        showStep(1);
    });
    </script>

    <!-- 添加提交成功动画容器 -->
    <div class="success-animation" id="successAnimation">
        <div class="success-content">
            <div class="success-icon">
                <i class="fas fa-check"></i>
            </div>
            <h2 class="success-title">申诉提交成功</h2>
            <p class="success-message">我们已收到您的申诉请求，工作人员将尽快处理</p>
            <div class="success-info">
                <p><i class="fas fa-clock me-2"></i>预计处理时间：24小时内</p>
                <p><i class="fas fa-envelope me-2"></i>处理结果将发送至您的QQ</p>
                <p><i class="fas fa-exclamation-circle me-2"></i>请保持QQ消息通畅</p>
            </div>
            <div class="success-buttons">
                <button class="btn btn-primary" onclick="window.location.href='status.jsp'">
                    <i class="fas fa-search me-2"></i>查看申诉状态
                </button>
                <button class="btn btn-outline-secondary" onclick="window.location.href='index.jsp'">
                    <i class="fas fa-home me-2"></i>返回首页
                </button>
            </div>
        </div>
    </div>
</body>
</html> 