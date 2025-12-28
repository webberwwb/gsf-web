# GrainStoryFarm Images

This folder contains all GrainStoryFarm-specific images for the website.

## Current Images

- `main-banner.JPG` - Hero section background image ✅

## Recommended Image Organization

You can organize your images here with descriptive names. Here are suggested filenames for the images you'll need:

### Service Icons (80x80px recommended)
- `service-icon-poultry.png` - Organic Poultry Products icon
- `service-icon-eggs.png` - Farm Fresh Eggs icon
- `service-icon-sustainable.png` - Sustainable Farming icon
- `service-icon-delivery.png` - Local Delivery icon

### Team Photos (300x300px recommended, square format)
- `team-founder.png` - Founder & Farm Manager
- `team-livestock.png` - Livestock Specialist
- `team-operations.png` - Operations Manager
- `team-quality.png` - Quality Assurance

### Testimonial Photos (100x100px recommended, square format)
- `testimonial-1.png` - First customer photo
- `testimonial-2.png` - Second customer photo
- `testimonial-3.png` - Third customer photo

### Blog Images (400x250px recommended, landscape format)
- `blog-free-range.png` - Free-Range Poultry Farming article
- `blog-sustainable.png` - Sustainable Farming Practices article
- `blog-organic.png` - Organic Certification article

### Other Images
- `about-thumb.png` - About section main image (500x600px recommended)
- `faq-image.png` - FAQ section illustration
- `icon-trusted.png` - Small icon for "100% trusted" box (50x50px)
- `banner-icon.png` - Banner icon for service labels

## Image Guidelines

- **Format**: PNG or JPG (WebP also supported)
- **Optimization**: Compress images for web to ensure fast loading
- **Naming**: Use lowercase with hyphens (e.g., `service-icon-poultry.png`)
- **Alt Text**: Remember to update alt text in `Home.vue` when adding new images

## Updating Image Paths

After adding images to this folder, update the paths in `/frontend/src/views/Home.vue`:

1. Open `Home.vue`
2. Find the image references in the `data()` section
3. Update paths from `/assets/images/home_two/...` to `/assets/images/grainstoryfarm/...`

Example:
```javascript
// Before
icon: '/assets/images/home_two/service_icon1.png'

// After
icon: '/assets/images/grainstoryfarm/service-icon-poultry.png'
```

