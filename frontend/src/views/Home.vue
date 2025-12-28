<template>
  <div id="app">
    <!-- Loader -->
    <div class="loader-wrapper" v-if="loading">
      <span class="loader"></span>
      <div class="loder-section left-section"></div>
      <div class="loder-section right-section"></div>
    </div>

    <!-- Header -->
    <div class="buddy-header-area style_two" id="sticky-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-lg-3">
            <div class="header-logo">
              <router-link to="/" class="d-flex align-items-center">
                <img :src="logoDark" alt="GrainStoryFarm Logo" />
                <h1 class="logo-title">GrainStoryFarm</h1>
              </router-link>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="header-menu">
              <ul class="nav_scroll">
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#service">Products</a></li>
                <li><a href="#faq">FAQ</a></li>
                <!-- <li><a href="#team">Team</a></li> -->
                <!-- <li><a href="#testimonial">Testimonial</a></li> -->
                <!-- <li><a href="#blog">Blog</a></li> -->
                <!-- <li><a href="#contact">Contact</a></li> -->
              </ul>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="menu_right_site">
              <div class="header-search-button search-box-outer">
                <a href="#" @click.prevent="toggleSearch"><i class="fas fa-search"></i></a>
              </div>
              <div class="sidebar-btn">
                <div class="nav-btn navSidebar-button" @click="toggleSidebar">
                  <span><i class="bi bi-filter-left"></i></span>
                </div>
              </div>
              <div class="header-button buddy_btn">
                <a href="#contact">Get In Touch<span></span></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Mobile Menu -->
    <div class="mobile-menu-area sticky d-sm-block d-md-block d-lg-none">
      <div class="mobile-menu-header">
        <div class="mobile-menu-logo">
          <router-link to="/" class="d-flex align-items-center">
            <img :src="logoDark" alt="GrainStoryFarm Logo" />
            <h1 class="mobile-logo-title">GrainStoryFarm</h1>
          </router-link>
        </div>
        <button class="mobile-hamburger" @click="toggleMobileMenu" :class="{ active: mobileMenuOpen }">
          <span></span>
          <span></span>
          <span></span>
        </button>
      </div>
      <!-- Yellow Navigation Bar - shown when hamburger is toggled -->
      <div class="mobile-nav-bar" :class="{ active: mobileMenuOpen }">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <div class="header-menu">
                <ul class="nav_scroll">
                  <li><a href="#home" @click="closeMobileMenu">Home</a></li>
                  <li><a href="#about" @click="closeMobileMenu">About</a></li>
                  <li><a href="#service" @click="closeMobileMenu">Products</a></li>
                  <li><a href="#faq" @click="closeMobileMenu">FAQ</a></li>
                  <!-- <li><a href="#team">Team</a></li> -->
                  <!-- <li><a href="#testimonial" @click="closeMobileMenu">Testimonial</a></li> -->
                  <!-- <li><a href="#blog">Blog</a></li> -->
                  <!-- <li><a href="#contact" @click="closeMobileMenu">Contact</a></li> -->
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Sidebar -->
    <div class="xs-sidebar-group info-group" :class="{ active: sidebarOpen }">
      <div class="xs-overlay xs-bg-black" @click="toggleSidebar"></div>
      <div class="xs-sidebar-widget">
        <div class="sidebar-widget-container">
          <div class="widget-heading">
            <a href="#" class="close-side-widget" @click.prevent="toggleSidebar">
              <i class="far fa-times-circle"></i>
            </a>
          </div>
          <div class="sidebar-textwidget">
            <div class="sidebar-info-contents">
              <div class="content-inner">
                <div class="nav-logo">
                  <router-link to="/">
                    <img :src="logoDark" alt="GrainStoryFarm Logo" />
                  </router-link>
                </div>
                <div class="contact-info">
                  <h2>Contact Info</h2>
                  <ul class="list-style-one">
                    <li><i class="bi bi-telephone"></i>(437) 352-9644</li>
                    <li><i class="bi bi-envelope"></i>grainstoryfarm@gmail.com</li>
                    <li><i class="bi bi-clock"></i>Week Days: 09.00 to 18.00 Sunday: Closed</li>
                  </ul>
                </div>
                <ul class="social-box">
                  <li class="facebook"><a href="#" class="fab fa-facebook-f"></a></li>
                  <li class="twitter"><a href="#" class="fab fa-instagram"></a></li>
                  <li class="linkedin"><a href="#" class="fab fa-twitter"></a></li>
                  <li class="instagram"><a href="#" class="fab fa-pinterest-p"></a></li>
                  <li class="youtube"><a href="#" class="fab fa-linkedin-in"></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Hero Section -->
    <section id="home" class="hero_area style_two d-flex align-items-center">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-12">
            <div class="hero_content style_two">
              <h4 class="sub_title">GrainStoryFarm Presents</h4>
              <h1>Connecting City Customers<br>with Trusted <span>Local</span> Farmers</h1>
              <p>We proudly partner with family-owned farms that raise and produce fresh, high-quality meat with care and integrity.</p>
              <div class="slider_button">
                <div class="hero_btn style_two buddy_btn">
                  <a href="#contact">Get In Touch <span></span></a>
                </div>
              </div>
              <div class="banner_list">
                <ul>
                  <li><i class="bi bi-check2"></i><span>Farm Fresh Quality</span></li>
                  <li><i class="bi bi-check2"></i><span>No Antibiotics or Hormones</span></li>
                  <li><i class="bi bi-check2"></i><span>Pre-Order Model</span></li>
                </ul>
              </div>
              <!-- <div class="banner_trusted_box bounce-animate2">
                <div class="trusted_icon">
                  <img :src="trustedIcon" alt="" />
                </div>
                <h3 class="trusted_title">100% trusted to investment</h3>
              </div> -->
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about_area style_two">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section_title home_two style_one pb-16">
              <h4>About GrainStoryFarm</h4>
              <h1>Premium Quality Meat from<br/><span>Trusted</span> Local Farms</h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-5 col-md-12">
            <div class="about_thumb">
              <img :src="aboutThumbImage" alt="GrainStoryFarm" />
            </div>
          </div>
          <div class="col-lg-7 col-md-12">
            <div class="about_content">
              <p>Grain Story Farm is dedicated to connecting city customers with trusted local farmers. We proudly partner with family-owned farms that raise and produce fresh, high-quality meat with care and integrity.</p>
              <p>Our product selection includes chicken, duck, geese, pigeon, guinea fowl, pheasant, Berkshire pork, goat, and lamb. All of our animals are free-run and raised without antibiotics or added hormones. We believe that healthy, well-cared-for animals create the most delicious and naturally flavorful meat.</p>
              <p>To ensure exceptional freshness, we operate on a pre-order model. Once an order is placed, the animals are sent to a licensed processing plant and prepared according to the exact order quantity. This approach guarantees that every product delivered to our customers is as fresh as possible.</p>
              <div class="about_content_image">
                <img :src="aboutImage" alt="GrainStoryFarm" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="about_shapes bounce-animate4">
        <img :src="shapeImage" alt="" />
      </div>
    </section>

    <!-- Feature/Service Section -->
    <section id="service" class="feature_area style_two">
      <div class="container">
        <div class="row">
          <div class="col-lg-5">
            <div class="section_title home_two pb-16">
              <h4>Our Products</h4>
              <h1>Fresh, High-Quality Meat<br/><span>Products</span> from Trusted <br>Local Farms</h1>
              <p>We offer a wide selection of premium meats, all raised free-run without antibiotics or added hormones, ensuring the most delicious and naturally flavorful products.</p>
            </div>
            <div class="buddy_btn_home_two buddy_btn">
              <a href="#contact">Find All Products<span></span></a>
            </div>
          </div>
          <div class="col-lg-7 col-md-12">
            <div class="row">
              <div class="col-lg-6 col-md-6" v-for="(service, index) in services" :key="index">
                <div class="feature_item style_two">
                  <div class="feature_icon">
                    <img :src="service.icon" alt="" />
                  </div>
                  <div class="feature_content">
                    <h3 class="feature_title">{{ service.title }}</h3>
                    <p>{{ service.description }}</p>
                  </div>
                  <div class="feature_button">
                    <a href="#contact">Find Out More<i class="flaticon flaticon-right-arrow"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="Service_shape bounce-animate4">
        <img :src="shapeImage" alt="" />
      </div>
    </section>

    <!-- FAQ Section -->
    <section id="faq" class="faq_area">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6">
            <div class="section_title home_two pb-50">
              <h4>Faq Frequency</h4>
              <h1>Premium Quality Meat<br/><span>Products</span> from Local Farms</h1>
            </div>
            <div class="tab_container">
              <div id="tab1" class="tab_content">
                <ul class="accordion">
                  <li v-for="(faq, index) in faqs" :key="index">
                    <a @click="toggleFaq(index)">
                      <span>{{ faq.question }}</span>
                    </a>
                    <p v-show="activeFaq === index">{{ faq.answer }}</p>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-12">
            <div class="faq_thumb">
              <img :src="faqImage" alt="GrainStoryFarm poultry care" />
            </div>
          </div>
        </div>
        <div class="row pt-67">
          <div class="col-lg-3 col-md-6" v-for="(stat, index) in statistics" :key="index">
            <div class="counter_songle_item">
              <div class="counter_content">
                <h1 class="counter">{{ stat.number }}</h1>
                <span>{{ stat.suffix }}</span>
                <p>{{ stat.label }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Team Section -->
    <!-- <section id="team" class="team_area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section_title home_two pb-83 text-center">
              <h4>Our Team Members</h4>
              <h1>Meet Our Experienced<br/><span>Team</span> People</h1>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6" v-for="(member, index) in teamMembers" :key="index">
            <div class="single_team_item">
              <div class="team_thumb">
                <img :src="member.image" :alt="member.name" />
              </div>
              <div class="team_content">
                <h3>{{ member.name }}</h3>
                <p>{{ member.role }}</p>
                <ul class="team_social">
                  <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                  <li><a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                  <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                  <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->

    <!-- Marquee Section -->
    <div class="marquee_area style_two">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
              <div class="marquee style2">
              <div class="marquee-block">
                <h3>Free-Run Animals</h3>
                <img :src="marqueeStar" alt="" />
                <span>No Antibiotics</span>
                <img :src="marqueeStar" alt="" />
                <h3>No Added Hormones</h3>
                <img :src="marqueeStar" alt="" />
                <span>Local Farmers</span>
                <img :src="marqueeStar" alt="" />
              </div>
              <div class="marquee-block">
                <h3>Pre-Order Model</h3>
                <img :src="marqueeStar" alt="" />
                <span>Fresh Processing</span>
                <img :src="marqueeStar" alt="" />
                <h3>Premium Quality</h3>
                <img :src="marqueeStar" alt="" />
                <span>Farm Fresh</span>
                <img :src="marqueeStar" alt="" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Testimonial Section -->
    <section id="testimonial" class="testimonial_area style_two">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-3">
            <div class="section_title home_two pb-16">
              <h4>Testimonial</h4>
              <h1>What They're Talking<br><span>About</span> Us?</h1>
              <p>Hear from our satisfied customers about their experience with GrainStoryFarm. We're proud to serve our community with fresh, quality poultry products.</p>
            </div>
            <div class="buddy_btn_home_two testimonal_btn buddy_btn">
              <a href="#contact">Order Now<span></span></a>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="testi_list owl-carousel">
              <div class="col-lg-12" v-for="(testimonial, index) in testimonials" :key="index">
                <div class="testimonial_item style_two">
                  <div class="testimonial-content">
                    <p>{{ testimonial.text }}</p>
                    <div class="testi-star">
                      <i v-for="i in 5" :key="i" class="fa fa-star active"></i>
                    </div>
                  </div>
                  <div class="tesit-auothor">
                    <div class="testi-author-thumb">
                      <img :src="testimonial.image" :alt="testimonial.name" />
                    </div>
                    <div class="bio">
                      <h4 class="name">{{ testimonial.name }}</h4>
                      <h5 class="designation">{{ testimonial.role }}</h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Custom dots navigation -->
            <div class="custom-testimonial-dots">
              <button
                v-for="(testimonial, index) in testimonials"
                :key="index"
                :class="['custom-dot', { active: currentTestimonialIndex === index }]"
                @click="goToTestimonial(index)"
                :aria-label="`Go to testimonial ${index + 1}`"
              ></button>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Blog Section -->
    <!-- <section id="blog" class="blog_area style_two">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-3">
            <div class="section_title home_two pb-16">
              <h4>Recent Articles</h4>
              <h1>Our Latest News<br>& <span>Articles</span> From<br>The Blog</h1>
              <p>Stay updated with the latest news, farming tips, and insights from GrainStoryFarm. Learn about sustainable farming, animal welfare, and healthy living.</p>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="blog_list2 owl-carousel">
              <div class="col-lg-12" v-for="(post, index) in blogPosts" :key="index">
                <div class="single-blog-box style_two">
                  <div class="single-blog-thumb">
                    <img :src="post.image" :alt="post.title" />
                  </div>
                  <div class="blog-content">
                    <div class="meta-blog">
                      <p><span><i class="bi bi-calculator-fill"></i></span>{{ post.date }}</p>
                    </div>
                    <div class="blog-title">
                      <h3><a href="#blog">{{ post.title }}</a></h3>
                    </div>
                    <div class="blog_btn">
                      <a href="#blog">Read More <i class="bi bi-arrow-right-short"></i></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->

    <!-- Contact Section -->
    <section id="contact" class="contact_area">
      <div class="container">
        <div class="row align-items-center">
          <div class="contact_container">
            <div class="col-lg-12">
              <div class="row">
                <div class="col-lg-8">
                  <div class="contact-form-box">
                    <h2 class="contact_title">Get In Touch</h2>
                    <form @submit.prevent="submitContactForm">
                      <div class="row">
                        <div class="col-lg-6 col-md-6">
                          <div class="form-box">
                            <input type="text" v-model="contactForm.name" placeholder="Your Name" required />
                            <i class="bi bi-person"></i>
                          </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                          <div class="form-box">
                            <input type="email" v-model="contactForm.email" placeholder="E-Mail Address" required />
                            <i class="bi bi-envelope"></i>
                          </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                          <div class="form-box">
                            <input type="text" v-model="contactForm.phone" placeholder="Your Phone" />
                            <i class="fas fa-phone-alt"></i>
                          </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                          <div class="form-box">
                            <input type="text" v-model="contactForm.website" placeholder="Website" />
                            <i class="bi bi-link-45deg"></i>
                          </div>
                        </div>
                        <div class="col-lg-12">
                          <div class="form-box">
                            <textarea v-model="contactForm.message" id="message" cols="30" rows="10" placeholder="Write Message" required></textarea>
                            <i class="bi bi-pencil"></i>
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="contact-form buddy_btn">
                            <button type="submit">Request Call Back <i class="bi bi-arrow-right-short"></i></button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="contact_sidebar">
                    <h2>Don't hesitate to contact us</h2>
                    <div class="contact_info">
                      <div class="contact_icon">
                        <i class="fas fa-phone-alt"></i>
                      </div>
                      <div class="contact_infos">
                        <p>Call Us</p>
                        <h3>(437) 352-9644</h3>
                      </div>
                    </div>
                    <div class="contact_info">
                      <div class="contact_icon">
                        <i class="bi bi-envelope"></i>
                      </div>
                      <div class="contact_infos">
                        <p>Write To Us</p>
                        <h3>grainstoryfarm@gmail.com</h3>
                      </div>
                    </div>
                    <div class="contact_info">
                      <div class="contact_icon">
                        <i class="fab fa-weixin"></i>
                      </div>
                      <div class="contact_infos">
                        <p>WeChat</p>
                        <h3>Grainstory</h3>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <section class="footer_area style_two">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="footer_logo">
              <router-link to="/">
                <img :src="logoWhite" alt="GrainStoryFarm Logo" />
              </router-link>
            </div>
            <p class="footer_desc">Grain Story Farm is dedicated to connecting city customers with trusted local farmers. We partner with family-owned farms to deliver fresh, high-quality meat products raised without antibiotics or added hormones.</p>
          </div>
          <div class="col-lg-1"></div>
          <div class="col-lg-2 col-md-6">
            <div class="footer-widget-content">
              <div class="footer-widget-title">
                <h4>Links</h4>
              </div>
              <div class="footer-widget-menu style_two">
                <ul>
                  <li><a href="#about"><i class="bi bi-chevron-double-right"></i> About Us</a></li>
                  <!-- <li><a href="#team"><i class="bi bi-chevron-double-right"></i> Meet The Team</a></li> -->
                  <li><a href="#service"><i class="bi bi-chevron-double-right"></i> Products</a></li>
                  <li><a href="#testimonial"><i class="bi bi-chevron-double-right"></i> Feedbacks</a></li>
                  <li><a href="#contact"><i class="bi bi-chevron-double-right"></i> Contact Us</a></li>
                  <!-- <li><a href="#blog"><i class="bi bi-chevron-double-right"></i> Blog</a></li> -->
                </ul>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-6">
            <div class="footer-widget-contact">
              <div class="footer-widget-title">
                <h4>Contact</h4>
              </div>
              <div class="footer-widget-address">
                <div class="footer_widget_icon">
                  <i class="fas fa-phone-alt"></i>
                </div>
                <div class="footer-widget-address_text">
                  <p>(437) 352-9644</p>
                </div>
              </div>
              <div class="footer-widget-address">
                <div class="footer_widget_icon">
                  <i class="bi bi-envelope-open"></i>
                </div>
                <div class="footer-widget-address_text">
                  <p>grainstoryfarm@gmail.com</p>
                </div>
              </div>
              <div class="footer-widget-address">
                <div class="footer_widget_icon">
                  <i class="bi bi-clock"></i>
                </div>
                <div class="footer-widget-address_text">
                  <p>Monday - Friday<br>9:00 AM - 5:00 PM</p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-6">
            <div class="footer-widget-content">
              <div class="footer-widget-title">
                <h4>WeChat</h4>
              </div>
              <div class="footer-wechat-qr">
                <img :src="wechatQR" alt="WeChat QR Code" />
              </div>
            </div>
          </div>
        </div>
        <div class="row add-border align-items-center">
          <div class="col-md-7">
            <div class="footer-bottom-content">
              <div class="footer-bottom-content-copy">
                <p>Copyright © {{ currentYear }} <span style="color: #E8B94F;">GrainStoryFarm</span>. All Rights Reserved.</p>
              </div>
            </div>
          </div>
          <div class="col-md-5 text-right">
            <div class="footer-bottom-content">
              <div class="footer-bottom-menu">
                <ul>
                  <li><a href="https://www.xiaohongshu.com/user/profile/663fa6330000000003030ee6" target="_blank" rel="noopener noreferrer">RED (xiao hong shu)</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Search Popup -->
    <div class="search-popup" :class="{ active: searchOpen }">
      <button class="close-search style-two" @click="toggleSearch">
        <span class="flaticon-multiply"><i class="far fa-times-circle"></i></span>
      </button>
      <form @submit.prevent="handleSearch">
        <div class="form-group">
          <input type="search" v-model="searchQuery" placeholder="Search Here" required />
          <button type="submit"><i class="fa fa-search"></i></button>
        </div>
      </form>
    </div>

    <!-- Scroll Up -->
    <div class="prgoress_indicator active-progress">
      <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"></path>
      </svg>
    </div>

    <!-- Success Modal -->
    <div class="success-modal-overlay" v-if="showSuccessModal" @click="closeSuccessModal">
      <div class="success-modal" @click.stop>
        <button class="success-modal-close" @click="closeSuccessModal">
          <i class="far fa-times-circle"></i>
        </button>
        <div class="success-modal-icon">
          <i class="bi bi-check-circle-fill"></i>
        </div>
        <h2 class="success-modal-title">Thank You!</h2>
        <p class="success-modal-message">We've received your message and will get back to you soon.</p>
        <button class="success-modal-button" @click="closeSuccessModal">Got it</button>
      </div>
    </div>
  </div>
</template>

<script>
import logoImage from '@/images/gsf-icon.png'
import logoDark from '@/images/logo-dark.png'
import logoWhite from '@/images/logo-white.png'
import wechatQR from '@/images/wechat-qr.png'
import faqImage from '@/images/main-widget-2.JPG'
import aboutImage from '@/images/main-widget-1.JPG'
import aboutThumbImage from '@/images/main-widget-0.JPG'
import trustedIcon from '@/images/icon.png'
import shapeImage from '@/images/shape.png'
import serviceIcon1 from '@/images/service_icon1.png'
import serviceIcon2 from '@/images/service_icon2.png'
import serviceIcon3 from '@/images/service_icon3.png'
import serviceIconSheep from '@/images/service_icon_sheep.svg'
import serviceIconPig from '@/images/service_icon_pig.svg'
import marqueeStar from '@/images/marquee_star.png'
import team1 from '@/images/team1.png'
import team2 from '@/images/team2.png'
import team3 from '@/images/team3.png'
import team4 from '@/images/team4.png'
import author1 from '@/images/aouthor1.png'
import author2 from '@/images/aouthor2.png'
import author3 from '@/images/aouthor3.png'
import blog1 from '@/images/blog1.png'
import blog2 from '@/images/blog2.png'
import blog3 from '@/images/blog3.png'
import testimonialMaxine from '@/images/testimonials/M.axine.jpg'
import testimonialVirginia from '@/images/testimonials/Virginia.jpg'
import testimonialTereza from '@/images/testimonials/Tereza Xiong.jpg'
import testimonialFybin from '@/images/testimonials/Fybin.jpg'
import testimonialDiamondWolf from '@/images/testimonials/DiamondWolf.jpg'
import testimonialHuahua from '@/images/testimonials/huahua.jpg'
import testimonialXSX from '@/images/testimonials/XSX.jpg'
import testimonialC from '@/images/testimonials/C.jpg'
import testimonialMary from '@/images/testimonials/Mary.jpg'
import testimonialDongni from '@/images/testimonials/dongni.jpg'

export default {
  name: 'Home',
  data() {
    return {
      logoImage,
      logoDark,
      logoWhite,
      wechatQR,
      faqImage,
      aboutImage,
      aboutThumbImage,
      trustedIcon,
      shapeImage,
      loading: true,
      sidebarOpen: false,
      searchOpen: false,
      mobileMenuOpen: false,
      searchQuery: '',
      activeFaq: null,
      showSuccessModal: false,
      currentTestimonialIndex: 0,
      testimonialCarousel: null,
      contactForm: {
        name: '',
        email: '',
        phone: '',
        website: '',
        message: ''
      },
      services: [
        {
          title: 'Chicken & Duck',
          description: 'Fresh chicken and duck raised free-run without antibiotics or added hormones. Partnering with trusted local family farms for premium quality poultry products.',
          icon: serviceIcon2
        },
        {
          title: 'Geese, Pigeon & Game Birds',
          description: 'Premium geese, pigeon, guinea fowl, and pheasant from local farms. All raised with care and integrity, ensuring exceptional flavor and quality.',
          icon: serviceIcon1
        },
        {
          title: 'Berkshire Pork',
          description: 'High-quality Berkshire pork from family-owned farms. Raised free-run without antibiotics or hormones, delivering naturally flavorful and delicious meat.',
          icon: serviceIconPig
        },
        {
          title: 'Goat & Lamb',
          description: 'Fresh goat and lamb products from trusted local farmers. All animals are raised with care, ensuring premium quality and exceptional freshness through our pre-order model.',
          icon: serviceIconSheep
        }
      ],
      faqs: [
        {
          question: 'What makes Grain Story Farm products different?',
          answer: 'We partner with trusted family-owned farms that raise animals free-run without antibiotics or added hormones. Our pre-order model ensures exceptional freshness - animals are processed only after your order is placed, guaranteeing the freshest possible products delivered to your table.'
        },
        {
          question: 'How does the pre-order model work?',
          answer: 'Once you place an order, the animals are sent to a licensed processing plant and prepared according to your exact order quantity. This approach ensures that every product delivered is as fresh as possible, as processing happens only after your order is confirmed.'
        },
        {
          question: 'What products do you offer?',
          answer: 'Our product selection includes chicken, duck, geese, pigeon, guinea fowl, pheasant, Berkshire pork, goat, and lamb. All animals are free-run and raised without antibiotics or added hormones, ensuring healthy, well-cared-for animals that create the most delicious and naturally flavorful meat.'
        },
        {
          question: 'How are your animals raised?',
          answer: 'All of our animals are free-run and raised without antibiotics or added hormones. We partner with family-owned farms that prioritize animal welfare and care. We believe that healthy, well-cared-for animals create the most delicious and naturally flavorful meat.'
        }
      ],
      statistics: [
        { number: 5, suffix: 'K+', label: 'Chickens Raised' },
        { number: 2, suffix: 'K+', label: 'Happy Customers' },
        { number: 15, suffix: '+', label: 'Farm Partners' },
        { number: 10, suffix: '+', label: 'Years Experience' }
      ],
      teamMembers: [
        {
          name: 'Farm Owner',
          role: 'Founder & Farm Manager',
          image: team1
        },
        {
          name: 'Team Member',
          role: 'Livestock Specialist',
          image: team2
        },
        {
          name: 'Team Member',
          role: 'Operations Manager',
          image: team3
        },
        {
          name: 'Team Member',
          role: 'Quality Assurance',
          image: team4
        }
      ],
      testimonials: [
        {
          text: 'So delicious—we made soy-sauce duck at home and it tasted amazing!',
          name: 'M.axine',
          role: 'Customer',
          image: testimonialMaxine
        },
        {
          text: 'The pearl chicken was delicious—perfect for nourishing this pregnant mama!',
          name: 'Virginia',
          role: 'Customer',
          image: testimonialVirginia
        },
        {
          text: 'The water duck was super fragrant with no fishy taste—way better than anything from the supermarket.',
          name: 'Tereza Xiong',
          role: 'Customer',
          image: testimonialTereza
        },
        {
          text: 'The duck was unbelievably delicious—perfect for soup or braising, and one bite instantly took me back to a countryside farm in China.',
          name: 'Fybin',
          role: 'Customer',
          image: testimonialFybin
        },
        {
          text: 'So tasty and incredibly fresh—when I got the chicken, it looked almost like it was still alive!',
          name: 'DiamondWolf',
          role: 'Customer',
          image: testimonialDiamondWolf
        },
        {
          text: 'Everything from your farm tastes absolutely amazing.',
          name: 'huahua',
          role: 'Customer',
          image: testimonialHuahua
        },
        {
          text: 'Your pork is amazing—even the fatty cuts are delicious, stir-fries come out crispy and fragrant, and the quality is on par with butcher-shop pork but at a better value.',
          name: 'XSX',
          role: 'Customer',
          image: testimonialXSX
        },
        {
          text: 'Compared to supermarket meat that barely renders any fat, your pork releases rich natural oil even from a small piece of fatty cut—totally worth the price.',
          name: 'C',
          role: 'Customer',
          image: testimonialC
        },
        {
          text: 'It was so delicious that we ate two chickens very fast—next time I\'m definitely getting three!',
          name: 'Mary',
          role: 'Customer',
          image: testimonialMary
        },
        {
          text: 'I stir-fried the chicken giblets yesterday and it was unbelievably delicious.',
          name: 'dongni',
          role: 'Customer',
          image: testimonialDongni
        }
      ],
      blogPosts: [
        {
          title: 'The Benefits of Free-Range Poultry Farming',
          date: 'December 15, 2024',
          image: blog1
        },
        {
          title: 'Sustainable Farming Practices at GrainStoryFarm',
          date: 'December 10, 2024',
          image: blog2
        },
        {
          title: 'Understanding Organic Certification and What It Means',
          date: 'December 5, 2024',
          image: blog3
        }
      ]
    }
  },
  computed: {
    currentYear() {
      return new Date().getFullYear()
    }
  },
  methods: {
    toggleSidebar() {
      this.sidebarOpen = !this.sidebarOpen
    },
    toggleSearch() {
      this.searchOpen = !this.searchOpen
    },
    toggleMobileMenu() {
      this.mobileMenuOpen = !this.mobileMenuOpen
    },
    closeMobileMenu() {
      this.mobileMenuOpen = false
    },
    toggleFaq(index) {
      this.activeFaq = this.activeFaq === index ? null : index
    },
    handleSearch() {
      console.log('Searching for:', this.searchQuery)
      this.searchOpen = false
    },
    submitContactForm() {
      console.log('Contact form submitted:', this.contactForm)
      // Show success modal
      this.showSuccessModal = true
      // Reset form
      this.contactForm = {
        name: '',
        email: '',
        phone: '',
        website: '',
        message: ''
      }
    },
    closeSuccessModal() {
      this.showSuccessModal = false
    },
    goToTestimonial(index) {
      if (this.testimonialCarousel) {
        this.testimonialCarousel.trigger('to.owl.carousel', index)
        this.currentTestimonialIndex = index
      }
    }
  },
  mounted() {
    // Hide loader after page loads
    setTimeout(() => {
      this.loading = false
    }, 1000)

    // Initialize template scripts after Vue mounts
    this.$nextTick(() => {
      if (window.jQuery) {
        // Initialize carousels, counters, etc.
        if (window.jQuery('.testi_list').length) {
          // Wait a bit for Vue to fully render all testimonials
          setTimeout(() => {
            const $carousel = window.jQuery('.testi_list')
            if ($carousel.length && !$carousel.hasClass('owl-loaded')) {
              const carousel = $carousel.owlCarousel({
                items: 1,
                loop: true,
                autoplay: true,
                autoplayTimeout: 5000,
                nav: false,
                dots: false,
                margin: 30,
                slideBy: 1
              })
              
              // Store carousel reference
              this.testimonialCarousel = $carousel
              
              // Update active dot on slide change
              $carousel.on('changed.owl.carousel', (event) => {
                this.currentTestimonialIndex = event.item.index
              })
            }
          }, 300)
        }
        // if (window.jQuery('.blog_list2').length) {
        //   window.jQuery('.blog_list2').owlCarousel({
        //     items: 3,
        //     loop: true,
        //     autoplay: true,
        //     autoplayTimeout: 5000,
        //     nav: false,
        //     dots: true,
        //     responsive: {
        //       0: { items: 1 },
        //       768: { items: 2 },
        //       992: { items: 3 }
        //     }
        //   })
        // }
        if (window.jQuery('.counter').length) {
          window.jQuery('.counter').counterUp({
            delay: 10,
            time: 2000
          })
        }
      }

      // Smooth scroll for anchor links
      document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
          const href = this.getAttribute('href')
          if (href !== '#' && href.length > 1) {
            e.preventDefault()
            const target = document.querySelector(href)
            if (target) {
              target.scrollIntoView({ behavior: 'smooth', block: 'start' })
            }
          }
        })
      })
    })
  }
}
</script>

<style scoped>
/* Additional Vue-specific styles if needed */
#app {
  width: 100%;
  overflow-x: hidden;
}

.loader-wrapper {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 9999;
  background: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
}

.loader-wrapper:not([v-if]) {
  display: none;
}

.search-popup {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.9);
  z-index: 9998;
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s ease;
}

.search-popup.active {
  opacity: 1;
  visibility: visible;
}

.xs-sidebar-group {
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s ease;
}

.xs-sidebar-group.active {
  opacity: 1;
  visibility: visible;
}

/* Logo height constraints */
.header-logo img,
.nav-logo img,
.footer_logo img {
  max-height: 50px;
  width: auto;
  object-fit: contain;
}

/* Logo title styling */
.logo-title {
  margin: 0;
  margin-left: 15px;
  font-size: 1.8rem;
  font-weight: 700;
  color: #333;
  line-height: 1.2;
  white-space: nowrap;
}

/* Ensure header doesn't expand */
.header-logo {
  display: flex;
  align-items: center;
  height: 100%;
}

.header-logo a {
  text-decoration: none;
  display: flex;
  align-items: center;
}

.nav-logo {
  display: flex;
  align-items: center;
}

.footer_logo {
  display: flex;
  align-items: center;
}

/* FAQ Image Sizing */
.faq_thumb img {
  width: 580px;
  height: 540px;
  object-fit: cover;
  border-radius: 10px;
}

@media (max-width: 991px) {
  .faq_thumb img {
    width: 100%;
    height: auto;
    max-width: 580px;
  }
}

/* About Thumb Image Sizing */
.about_thumb img {
  width: 500px;
  height: auto;
  object-fit: contain;
  border-radius: 10px;
}

/* About Shape Image Sizing */
.about_shape img {
  width: 401px;
  height: 200px;
  object-fit: cover;
  border-radius: 10px;
}

/* About Content Image */
.about_content_image {
  margin-top: 40px;
  overflow: hidden;
  border-radius: 10px;
  max-width: 550px;
}

.about_content_image img {
  width: 100%;
  max-width: 100%;
  height: auto;
  object-fit: cover;
  border-radius: 10px;
}

@media (max-width: 991px) {
  .about_thumb img {
    width: 100%;
    max-height: 500px;
  }
  .about_shape img {
    width: 100%;
    height: auto;
    max-width: 401px;
  }
  
  .about_content_image {
    margin-top: 20px;
  }
  
  .about_content_image img {
    max-width: 100%;
  }
}

/* Mobile Menu Logo */
.mobile-menu-header {
  padding: 15px 20px;
  background: #fff;
  border-bottom: 1px solid #eee;
}

.mobile-menu-logo {
  display: flex;
  align-items: center;
}

.mobile-menu-logo a {
  text-decoration: none;
  display: flex;
  align-items: center;
}

.mobile-menu-logo img {
  max-height: 40px;
  width: auto;
  object-fit: contain;
}

.mobile-logo-title {
  margin: 0;
  margin-left: 12px;
  font-size: 1.4rem;
  font-weight: 700;
  color: #333;
  line-height: 1.2;
  white-space: nowrap;
}

@media (max-width: 576px) {
  .mobile-menu-header {
    padding: 12px 15px;
  }
  
  .mobile-menu-logo img {
    max-height: 35px;
  }
  
  .mobile-logo-title {
    font-size: 1.2rem;
    margin-left: 10px;
  }
}

/* Footer WeChat QR Code */
.footer-wechat-qr {
  margin-top: 10px;
}

.footer-wechat-qr img {
  width: 150px;
  height: 150px;
  object-fit: contain;
  border-radius: 8px;
  background: #ffffff;
  padding: 8px;
}

@media (max-width: 991px) {
  .footer-wechat-qr img {
    width: 120px;
    height: 120px;
  }
}

/* Success Modal */
.success-modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 10000;
  animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.success-modal {
  background: #ffffff;
  border-radius: 16px;
  padding: 40px;
  max-width: 500px;
  width: 90%;
  position: relative;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
  animation: slideUp 0.3s ease;
}

@keyframes slideUp {
  from {
    transform: translateY(30px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

.success-modal-close {
  position: absolute;
  top: 15px;
  right: 15px;
  background: transparent;
  border: none;
  font-size: 24px;
  color: #999;
  cursor: pointer;
  padding: 5px;
  line-height: 1;
  transition: color 0.3s ease;
}

.success-modal-close:hover {
  color: #333;
}

.success-modal-icon {
  text-align: center;
  margin-bottom: 20px;
}

.success-modal-icon i {
  font-size: 64px;
  color: #E8B94F;
  display: inline-block;
  animation: scaleIn 0.4s ease 0.2s both;
}

@keyframes scaleIn {
  from {
    transform: scale(0);
  }
  to {
    transform: scale(1);
  }
}

.success-modal-title {
  font-size: 28px;
  font-weight: 600;
  color: #333;
  text-align: center;
  margin-bottom: 15px;
  font-family: "Oswald", sans-serif;
}

.success-modal-message {
  font-size: 16px;
  color: #666;
  text-align: center;
  line-height: 1.6;
  margin-bottom: 30px;
}

.success-modal-button {
  width: 100%;
  padding: 14px 30px;
  background: #E8B94F;
  color: #ffffff;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  font-family: "Oswald", sans-serif;
}

.success-modal-button:hover {
  background: #d4a542;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(232, 185, 79, 0.3);
}

.success-modal-button:active {
  transform: translateY(0);
}

@media (max-width: 576px) {
  .success-modal {
    padding: 30px 20px;
  }
  
  .success-modal-title {
    font-size: 24px;
  }
  
  .success-modal-icon i {
    font-size: 48px;
  }
}

/* Footer copyright mobile alignment */
@media (max-width: 767px) {
  .row.add-border .footer-bottom-content-copy {
    padding-left: 0 !important;
    margin-left: 0 !important;
  }
  
  .row.add-border .footer-bottom-content-copy p {
    text-align: left !important;
    padding-left: 0 !important;
    margin-left: 0 !important;
  }
  
  .row.add-border .col-md-7 {
    padding-left: 15px;
    padding-right: 15px;
  }
  
  .row.add-border .col-md-5 {
    padding-left: 15px;
    padding-right: 15px;
    text-align: left !important;
  }
  
  .row.add-border .footer-bottom-menu {
    text-align: left !important;
    margin-top: 10px;
  }
  
  .row.add-border .footer-bottom-menu ul {
    padding-left: 0;
    margin: 0;
  }
}

/* RED link underline styling */
.row.add-border .footer-bottom-menu ul li a {
  text-decoration: underline !important;
}

.row.add-border .footer-bottom-menu ul li a:hover {
  text-decoration: underline !important;
}

/* Testimonial avatar size */
.testi-author-thumb img {
  width: 64px;
  height: 64px;
  object-fit: cover;
  border-radius: 50%;
}


/* Testimonial carousel styling */
.testi_list .col-lg-12 {
  padding: 0 15px;
}

/* Limit testimonial card max width on large screens only */
@media (min-width: 992px) {
  .testimonial_item.style_two {
    max-width: 720px;
    margin-left: 30px;
    margin-right: auto;
  }
}

/* Center align items vertically in testimonial section */
#testimonial .row {
  align-items: center;
}

/* Custom testimonial dots */
.custom-testimonial-dots {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-top: 30px;
  flex-wrap: wrap;
}

.custom-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  border: none;
  background-color: #ddd;
  cursor: pointer;
  padding: 0;
  transition: all 0.3s ease;
}

.custom-dot:hover {
  background-color: #bbb;
  transform: scale(1.2);
}

.custom-dot.active {
  background-color: #E8B94F;
  width: 30px;
  border-radius: 6px;
}

/* Mobile hamburger menu styling */
@media (max-width: 991px) {
  /* Hide the yellow navigation bar on mobile */
  .buddy-header-area.style_two {
    display: none !important;
  }
  
  /* Mobile menu header with hamburger */
  .mobile-menu-header {
    position: relative;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
  }
  
  /* Hamburger button */
  .mobile-hamburger {
    background: none;
    border: none;
    width: 24px;
    height: 18px;
    position: relative;
    cursor: pointer;
    padding: 0;
    z-index: 1001;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  
  .mobile-hamburger span {
    display: block;
    height: 2px;
    width: 100%;
    background: #333;
    border-radius: 1px;
    transition: all 0.3s ease;
  }
  
  .mobile-hamburger.active span:nth-child(1) {
    transform: rotate(45deg) translate(6px, 6px);
  }
  
  .mobile-hamburger.active span:nth-child(2) {
    opacity: 0;
  }
  
  .mobile-hamburger.active span:nth-child(3) {
    transform: rotate(-45deg) translate(6px, -6px);
  }
  
  /* Yellow Navigation Bar - shown when hamburger is toggled */
  .mobile-nav-bar {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease;
    background: #E8B94F;
    padding: 0;
  }
  
  .mobile-nav-bar.active {
    max-height: 400px;
    padding: 0;
  }
  
  .mobile-nav-bar .nav_scroll {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    list-style: none;
    padding: 0;
    margin: 0;
  }
  
  .mobile-nav-bar .nav_scroll li {
    flex: 1 1 auto;
    border: none;
  }
  
  .mobile-nav-bar .nav_scroll li a {
    display: block;
    padding: 15px 10px;
    color: #ffffff;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    font-family: "Roboto";
    transition: background 0.3s ease;
    text-align: center;
  }
  
  .mobile-nav-bar .nav_scroll li a:hover {
    background: rgba(255, 255, 255, 0.1);
    text-decoration: none;
  }
  
  /* Hide meanmenu default styling */
  .mean-container a.meanmenu-reveal {
    display: none !important;
  }
}
</style>
