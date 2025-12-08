# Design Document

## Overview

This design document outlines the technical approach for enhancing Dr. Vahid Zare's profile website. The website will feature a modern, beautiful, and mobile-responsive design with clear sections for profile information, professional experience, and educational background. The design emphasizes clean aesthetics, proper Persian typography using IranSans fonts, and optimal user experience across all devices.

## Architecture

The website follows a single-page application (SPA) architecture with the following structure:

### Page Structure
1. **Header Section**: Fixed navigation bar with logo and menu links
2. **Hero Section**: Full-height welcome area with profile image, name, title, medical license number, and social media links
3. **About Section**: Professional description and biography
4. **Experience Section**: List of hospitals and medical facilities where the doctor has worked
5. **Education Section**: Timeline of educational qualifications
6. **Footer Section**: Copyright information

### Technology Stack
- HTML5 for semantic markup
- CSS3 for styling and animations
- Bootstrap RTL for responsive grid system (already included)
- Font Awesome for icons (already included)
- Vanilla JavaScript for smooth scrolling and interactions

## Components and Interfaces

### 1. Header Component
- Fixed navigation bar that stays visible during scroll
- Logo/home link on the right (RTL layout)
- Navigation menu on the left with smooth scroll links
- Responsive hamburger menu for mobile devices

### 2. Hero Section Component
- Full viewport height background with overlay
- Centered profile image (circular, 200px diameter)
- Doctor name (h2 heading)
- Professional title and medical license number
- Social media icon links (Instagram, LinkedIn, Medical Council)
- Hover effects on social icons

### 3. About Section Component
- Container with shadow card design
- Section title
- Professional biography text with proper line height
- Responsive padding and margins

### 4. Experience Section Component
- Container with shadow card design
- Section title "سوابق کاری" (Work Experience)
- List of work experiences with:
  - Hospital/facility name
  - Position/role
  - Icon indicators
  - Consistent styling

### 5. Education Section Component
- Container with shadow card design
- Section title "تحصیلات" (Education)
- Timeline layout with:
  - Degree type (left column in RTL)
  - Date range (right column)
  - Institution name
  - Visual timeline connector
  - Circular markers

### 6. Footer Component
- Copyright text
- Centered layout
- Minimal padding

## Data Models

### Doctor Profile Data
```javascript
{
  name: "دکتر وحید زارع",
  title: "رزیدنت جراحی مغز و اعصاب شیراز",
  medicalLicenseNumber: "163748",
  profileImage: "Content/Images/Profile.jpg",
  socialLinks: [
    { platform: "instagram", url: "https://instagram.com/neuro_surgery.ir/", icon: "fa-instagram" },
    { platform: "instagram", url: "https://www.instagram.com/dr.vahidzare/", icon: "fa-instagram" },
    { platform: "medical-council", url: "https://membersearch.irimc.org/member/profile?id=...", icon: "fa-globe" },
    { platform: "linkedin", url: "https://www.linkedin.com/in/vahid-zare-527a20161/", icon: "fa-linkedin" }
  ],
  about: "Professional biography text...",
  experience: [
    { facility: "شرکت ملی حفاری و شرکت نفت وزارت نفت", role: "پزشک" },
    { facility: "بیمارستان شهرستان سوسنگرد و هویزه", role: "پزشک اورژانس" },
    // ... more experiences
  ],
  education: [
    { degree: "رشته تجربی", institution: "دبیرستان نمونه دولتی ملک ثابت یزد", years: "1385 - 1389" },
    { degree: "دکترای حرفه‌ای", institution: "دانشگاه جندی شاپور اهواز", years: "1389 - 1396" },
    { degree: "دکترای تخصصی", institution: "دانشگاه شیراز", years: "1398 تاکنون" }
  ]
}
```

## Correctness Properties

*A property is a characteristic or behavior that should hold true across all valid executions of a system-essentially, a formal statement about what the system should do. Properties serve as the bridge between human-readable specifications and machine-verifiable correctness guarantees.*


### Property 1: Social media links open in new tabs
*For any* social media link in the header section, clicking the link should open the target URL in a new browser tab (target="_blank" attribute present)
**Validates: Requirements 1.4**

### Property 2: Work experience completeness
*For any* work experience entry displayed, the rendered HTML should contain both the facility name and role information
**Validates: Requirements 3.2**

### Property 3: Education entry completeness
*For any* education entry displayed, the rendered HTML should contain degree type, institution name, and date range
**Validates: Requirements 4.2**

### Property 4: Education chronological ordering
*For any* list of education entries, they should be ordered chronologically from earliest to latest (or latest to earliest consistently)
**Validates: Requirements 4.3**

### Property 5: Responsive layout adaptation
*For any* viewport width (mobile: <768px, tablet: 768-991px, desktop: >991px), all sections should be visible without horizontal scrolling and elements should not overflow their containers
**Validates: Requirements 5.1, 5.2, 5.4**

### Property 6: Image responsive scaling
*For any* image element on the page, it should have responsive classes or CSS that prevents it from exceeding its container width
**Validates: Requirements 5.5**

### Property 7: Persian text font application
*For any* text element containing Persian characters, the computed font-family should include IranSans or the fallback font specified in the CSS
**Validates: Requirements 6.2**

### Property 8: Interactive element hover states
*For any* interactive element (links, buttons), there should be CSS hover state definitions that provide visual feedback
**Validates: Requirements 6.4**

## Error Handling

### Missing Resources
- If profile image fails to load, display alt text
- If font files fail to load, fall back to system fonts (Tahoma, Arial)
- If external links are broken, ensure they still display correctly

### Responsive Breakpoints
- Handle edge cases at exact breakpoint widths (767px, 768px, 991px, 992px)
- Ensure smooth transitions between breakpoints
- Test on actual devices, not just browser dev tools

### Browser Compatibility
- Ensure CSS fallbacks for older browsers
- Test on major browsers: Chrome, Firefox, Safari, Edge
- Provide graceful degradation for unsupported features

## Testing Strategy

### Manual Testing
- Visual inspection of design on multiple devices
- Test all links for correct destinations
- Verify Persian text renders correctly with IranSans font
- Check hover states on all interactive elements
- Test responsive behavior at various viewport sizes

### Automated Testing
Since this is primarily a static website enhancement focused on visual design and layout, automated testing will be minimal. However, we can implement:

1. **DOM Structure Tests**: Verify that required sections and elements exist
2. **Attribute Tests**: Check that links have correct href and target attributes
3. **CSS Tests**: Verify that font-face declarations exist and reference correct files
4. **Responsive Tests**: Check that elements have appropriate responsive classes

### Property-Based Testing
We will use a JavaScript testing framework to implement property-based tests for the correctness properties defined above.

**Testing Library**: We will use **fast-check** (a property-based testing library for JavaScript/TypeScript) along with **Jest** as the test runner.

**Configuration**: Each property-based test will run a minimum of 100 iterations to ensure thorough coverage of the input space.

**Test Tagging**: Each property-based test will include a comment tag in this format:
```javascript
// Feature: doctor-profile-enhancement, Property 1: Social media links open in new tabs
```

## Visual Design Specifications

### Color Scheme
- Primary Color: #03A9F4 (Material Blue)
- Background: #F5F5F5 (Light Gray)
- Text: #333 (Dark Gray)
- White: #FFFFFF
- Overlay: rgba(3, 169, 244, 0.4)

### Typography
- **Primary Font (Persian)**: IranSans (from fonts/IRANSans-Light-web.woff, fonts/IRANSans-Light-web.ttf)
- **Secondary Font (Headings)**: SDF (IranSans Light)
- **Fallback Fonts**: Tahoma, Arial, sans-serif
- **Body Font Size**: 15px
- **Line Height**: 32px for paragraphs, 24px for body
- **Heading Sizes**: 
  - h2: 40px (section titles), 70px (hero name)
  - h3: 18px
  - h4: 12px

### Spacing
- Section Padding: 60px (desktop), 30px (mobile)
- Container Padding: 60px (desktop), 30px (mobile)
- Element Margins: 20-30px between major elements
- List Item Margins: 25px bottom

### Shadows and Depth
- Card Shadow: `box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12)`
- Header Shadow: `box-shadow: 0 3px 3px rgba(0, 0, 0, .29)`

### Animations and Transitions
- Standard Transition: `transition: all 0.3s ease-out`
- Hover Effects: Color and background changes with 0.3s transition
- Smooth Scroll: Implemented via JavaScript for anchor links

### Responsive Breakpoints
- Mobile: max-width 767px
- Tablet: 768px - 991px
- Desktop: 992px and above

## Implementation Notes

### File Cleanup
Remove unnecessary files to optimize load time:
- Remove unused CSS files (keep only: all.min.css which bundles everything needed)
- Remove unused JavaScript files (keep only: all.min.js which bundles everything needed)
- Remove unused font files (keep only IranSans fonts: IRANSans-Light-web.woff, IRANSans-Light-web.ttf)
- Remove theme.css (file input theme not needed)
- Remove other font files (FontAwesome, Parastoo if not used, glyphicons)

### Font Loading Optimization
- Use font-display: swap for better performance
- Load only required font weights
- Ensure proper @font-face declarations

### Mobile Optimization
- Use viewport meta tag for proper scaling
- Implement touch-friendly button sizes (minimum 44x44px)
- Optimize images for mobile (consider using srcset for different resolutions)
- Reduce padding and font sizes appropriately on mobile

### RTL (Right-to-Left) Support
- Use Bootstrap RTL classes for proper layout
- Ensure text alignment is correct for Persian content
- Test navigation menu alignment in RTL context

### Performance Considerations
- Minimize HTTP requests by using bundled CSS/JS files
- Optimize images (compress Profile.jpg and bg.jpg)
- Use CSS animations instead of JavaScript where possible
- Lazy load images if needed (though with only one profile image, not critical)

## Component Styling Details

### Header Navigation
```css
- Fixed position at top
- Background: #03A9F4
- Height: ~80px (desktop), ~60px (mobile)
- Logo: right-aligned (RTL)
- Menu: left-aligned (RTL)
- Smooth scroll behavior on menu clicks
```

### Hero Section
```css
- Height: 100vh
- Background image with overlay
- Centered content
- Profile image: 200px diameter, circular, white border
- Name: 70px font size (desktop), 35px (mobile)
- Social icons: 30px circles, white background, hover effect
```

### Content Sections (About, Experience, Education)
```css
- White background with shadow
- 60px padding (desktop), 30px (mobile)
- Section titles: 40px font size, centered, 60px bottom margin
- Consistent spacing between elements
```

### Experience List
```css
- List items with icon indicators
- Inline-block display with spacing
- Background color for emphasis
- Rounded corners (30px border-radius)
```

### Education Timeline
```css
- Two-column layout (degree type | details)
- Visual timeline with connecting line
- Circular markers at each entry
- Responsive: stacks on mobile
```

### Footer
```css
- 80px padding
- Centered text
- Simple, minimal design
```
