<template>
  <div class="under-construction">
    <div class="construction-content">
      <div class="logo-container">
        <img :src="logoImage" alt="GrainStoryFarm Logo" class="construction-logo" />
        <h1 class="construction-title">GrainStoryFarm</h1>
      </div>
      <div class="construction-message">
        <h2>Website Under Construction</h2>
        <p>We're working hard to bring you something amazing!</p>
        <p class="sub-text">Please check back soon.</p>
      </div>
    </div>
  </div>
</template>

<script>
import logoImage from '@/images/gsf-icon.png'

export default {
  name: 'UnderConstruction',
  data() {
    return {
      logoImage
    }
  }
}
</script>

<style scoped>
.under-construction {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #f4d03f 0%, #f39c12 50%, #e67e22 100%);
  padding: 20px;
}

.construction-content {
  text-align: center;
  background: white;
  padding: 60px 40px;
  border-radius: 20px;
  box-shadow: 0 20px 60px rgba(244, 208, 63, 0.4);
  max-width: 600px;
  width: 100%;
}

.logo-container {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 15px;
  margin-bottom: 40px;
}

.construction-logo {
  max-height: 60px;
  width: auto;
}

.construction-title {
  margin: 0;
  font-size: 2.5rem;
  font-weight: 700;
  color: #333;
}

.construction-message h2 {
  font-size: 2rem;
  color: #f39c12;
  margin-bottom: 20px;
  font-weight: 600;
}

.construction-message p {
  font-size: 1.2rem;
  color: #666;
  margin-bottom: 10px;
  line-height: 1.6;
}

.sub-text {
  font-size: 1rem;
  color: #999;
  font-style: italic;
}

@media (max-width: 768px) {
  .construction-content {
    padding: 40px 30px;
  }
  
  .construction-title {
    font-size: 2rem;
  }
  
  .construction-message h2 {
    font-size: 1.5rem;
  }
  
  .construction-message p {
    font-size: 1rem;
  }
  
  .logo-container {
    flex-direction: column;
    gap: 10px;
  }
}
</style>

