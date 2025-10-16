# ResponsiveHelper Usage Guide

## Overview
ResponsiveHelper is a utility class that helps create responsive Flutter UIs that adapt to different screen sizes (mobile, tablet, desktop). It provides consistent breakpoints and scaling methods across your app.

## Table of Contents
1. [Basic Concepts](#basic-concepts)
2. [Device Detection](#device-detection)
3. [Adaptive Values](#adaptive-values)
4. [Spacing & Padding](#spacing--padding)
5. [Font Sizing](#font-sizing)
6. [Constraints & Layouts](#constraints--layouts)
7. [Real-World Examples](#real-world-examples)
8. [Best Practices](#best-practices)

---

## Basic Concepts

### Breakpoints
```dart
// Device breakpoints (width in pixels)
Mobile:  < 600px
Tablet:  600px - 900px  
Desktop: > 900px
```

### Import
```dart
import 'package:rclink_app/shared/utils/responsive_helper.dart';
```

---

## Device Detection

### Check Device Type
```dart
// Get current device type
DeviceType deviceType = ResponsiveHelper.getDeviceType(context);

// Boolean checks
if (ResponsiveHelper.isMobile(context)) {
  // Mobile-specific code
}

if (ResponsiveHelper.isTablet(context)) {
  // Tablet-specific code
}

if (ResponsiveHelper.isDesktop(context)) {
  // Desktop-specific code
}
```

### Check Orientation
```dart
if (ResponsiveHelper.isLandscape(context)) {
  // Landscape layout
}

if (ResponsiveHelper.isPortrait(context)) {
  // Portrait layout
}
```

---

## Adaptive Values

### Basic Adaptive Method
Returns different values based on device type:

```dart
// Simple adaptive value
double boxSize = ResponsiveHelper.adaptive<double>(
  context,
  mobile: 50,
  tablet: 65,    // Optional - defaults to mobile if not provided
  desktop: 80,   // Optional - defaults to tablet or mobile
);

// Works with any type
String text = ResponsiveHelper.adaptive<String>(
  context,
  mobile: "Tap",
  tablet: "Click",
  desktop: "Click",
);

// Widget example
Widget icon = ResponsiveHelper.adaptive<Widget>(
  context,
  mobile: Icon(Icons.phone),
  tablet: Icon(Icons.tablet),
  desktop: Icon(Icons.computer),
);
```

---

## Spacing & Padding

### Responsive Spacing
```dart
// Basic spacing - automatically scales by device
SizedBox(
  height: ResponsiveHelper.spacing(context, 16),
  // Mobile: 16px, Tablet: 20.8px, Desktop: 24px
);

// Custom multiplier
SizedBox(
  height: ResponsiveHelper.spacing(context, 20, multiplier: 1.5),
);
```

### Responsive Padding
```dart
// Uniform padding
Container(
  padding: ResponsiveHelper.padding(context, all: 16),
  child: Text("Content"),
);

// Directional padding
Container(
  padding: ResponsiveHelper.padding(
    context,
    horizontal: 20,
    vertical: 16,
  ),
  child: Text("Content"),
);

// Individual sides
Container(
  padding: ResponsiveHelper.padding(
    context,
    left: 16,
    right: 16,
    top: 8,
    bottom: 24,
  ),
  child: Text("Content"),
);
```

---

## Font Sizing

### Basic Font Sizing
```dart
Text(
  "Responsive Text",
  style: TextStyle(
    fontSize: ResponsiveHelper.fontSize(
      context,
      base: 16,  // Base size to scale from
    ),
    // Mobile: 16px, Tablet: 18.4px, Desktop: 20.8px
  ),
);

// With breakpoint sizes
Text(
  "Custom Size Text",
  style: TextStyle(
    fontSize: ResponsiveHelper.fontSize(
      context,
      base: 14,
      sm: 14,   // Small screens
      md: 16,   // Medium screens
      lg: 18,   // Large screens
      xl: 20,   // Extra large screens
    ),
  ),
);
```

### Adaptive Font Sizing
```dart
Text(
  "Adaptive Text",
  style: TextStyle(
    fontSize: ResponsiveHelper.adaptive(
      context,
      mobile: 14,
      tablet: 16,
      desktop: 18,
    ),
  ),
);
```

---

## Constraints & Layouts

### Content Constraints
```dart
// For main content areas
Container(
  constraints: ResponsiveHelper.getContentConstraints(context),
  // Mobile: maxWidth = infinity
  // Tablet: maxWidth = 600px
  // Desktop: maxWidth = 800px
  child: YourContent(),
);
```

### Dialog Constraints
```dart
// For dialogs and modals
Dialog(
  child: Container(
    constraints: ResponsiveHelper.getDialogConstraints(context),
    // Mobile: maxWidth = infinity
    // Tablet: maxWidth = 500px
    // Desktop: maxWidth = 600px
    child: DialogContent(),
  ),
);
```

### Percentage-based Sizing
```dart
// Width as percentage of screen
Container(
  width: ResponsiveHelper.getWidth(context, 0.5), // 50% of screen width
  height: ResponsiveHelper.getHeight(context, 0.3), // 30% of screen height
);
```

---

## Real-World Examples

### 1. Responsive Card
```dart
class ResponsiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: ResponsiveHelper.getContentConstraints(context),
      margin: ResponsiveHelper.padding(context, all: 16),
      padding: ResponsiveHelper.padding(
        context,
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: ResponsiveHelper.borderRadius(context, all: 12),
        boxShadow: [
          BoxShadow(
            blurRadius: ResponsiveHelper.adaptive(
              context,
              mobile: 4,
              tablet: 6,
              desktop: 8,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Card Title",
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 20),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ResponsiveHelper.spacing(context, 12)),
          Text(
            "Card content goes here",
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 14),
            ),
          ),
        ],
      ),
    );
  }
}
```

### 2. Responsive Grid
```dart
class ResponsiveGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveHelper.gridColumns(
          context,
          baseColumns: 2, // 2 on mobile, 3 on tablet, 4 on desktop
        ),
        spacing: ResponsiveHelper.spacing(context, 16),
        mainAxisSpacing: ResponsiveHelper.spacing(context, 16),
      ),
      itemBuilder: (context, index) => GridItem(),
    );
  }
}
```

### 3. Responsive Button
```dart
class ResponsiveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: ResponsiveHelper.padding(
          context,
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: ResponsiveHelper.borderRadius(context, all: 8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ResponsiveHelper.adaptive(
            context,
            mobile: 14,
            tablet: 16,
            desktop: 18,
          ),
        ),
      ),
    );
  }
}
```

### 4. Responsive Form Field
```dart
class ResponsiveTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: ResponsiveHelper.isTablet(context)
          ? BoxConstraints(maxWidth: 500)
          : BoxConstraints(),
      child: TextField(
        style: TextStyle(
          fontSize: ResponsiveHelper.fontSize(context, base: 16),
        ),
        decoration: InputDecoration(
          contentPadding: ResponsiveHelper.padding(
            context,
            horizontal: 16,
            vertical: 12,
          ),
          hintStyle: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 14),
          ),
          border: OutlineInputBorder(
            borderRadius: ResponsiveHelper.borderRadius(context, all: 8),
          ),
        ),
      ),
    );
  }
}
```

### 5. Responsive Icon Size
```dart
Icon(
  Icons.home,
  size: ResponsiveHelper.iconSize(context, base: 24),
  // Mobile: 24px, Tablet: 28.8px, Desktop: 33.6px
)
```

---

## Best Practices

### 1. Use Consistent Breakpoints
Always use ResponsiveHelper methods instead of hardcoding breakpoints:
```dart
// ✅ Good
if (ResponsiveHelper.isMobile(context)) { }

// ❌ Bad
if (MediaQuery.of(context).size.width < 600) { }
```

### 2. Prefer Adaptive Over Conditional
```dart
// ✅ Good - Clean and readable
double size = ResponsiveHelper.adaptive(
  context,
  mobile: 100,
  tablet: 150,
  desktop: 200,
);

// ❌ Bad - Verbose
double size;
if (ResponsiveHelper.isMobile(context)) {
  size = 100;
} else if (ResponsiveHelper.isTablet(context)) {
  size = 150;
} else {
  size = 200;
}
```

### 3. Use LayoutBuilder for Complex Layouts
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (ResponsiveHelper.isMobile(context)) {
      return MobileLayout();
    } else if (ResponsiveHelper.isTablet(context)) {
      return TabletLayout();
    } else {
      return DesktopLayout();
    }
  },
)
```

### 4. Test on Different Screen Sizes
Always test your responsive layouts on:
- Mobile: 375px (iPhone SE), 414px (iPhone Plus)
- Tablet: 768px (iPad), 834px (iPad Pro 11")
- Desktop: 1280px, 1920px

### 5. Consider Orientation
```dart
Widget build(BuildContext context) {
  if (ResponsiveHelper.isTablet(context) && 
      ResponsiveHelper.isLandscape(context)) {
    // Special layout for tablet landscape
    return TabletLandscapeLayout();
  }
  // Default layout
  return DefaultLayout();
}
```

### 6. Use Constraints for Maximum Widths
```dart
// Prevent content from stretching too wide on large screens
Container(
  constraints: ResponsiveHelper.getContentConstraints(context),
  child: YourContent(),
)
```

---

## Common Patterns

### Bottom Sheet Height
```dart
showModalBottomSheet(
  context: context,
  builder: (context) => Container(
    height: MediaQuery.of(context).size.height * 
      ResponsiveHelper.adaptive(
        context,
        mobile: 0.75,
        tablet: 0.6,
        desktop: 0.5,
      ),
    child: Content(),
  ),
);
```

### Responsive Column/Row
```dart
ResponsiveHelper.isMobile(context)
    ? Column(children: widgets)  // Stack vertically on mobile
    : Row(children: widgets);    // Side by side on tablet/desktop
```

### Adaptive Icons
```dart
IconButton(
  icon: Icon(Icons.menu),
  iconSize: ResponsiveHelper.iconSize(context, base: 24),
  onPressed: () {},
)
```

---

## Tips

1. **Start Mobile-First**: Design for mobile, then enhance for larger screens
2. **Use Spacer Widgets**: They work great with responsive padding/spacing
3. **Test Early**: Check responsive behavior during development, not at the end
4. **Consider Touch Targets**: Ensure buttons are at least 44px on mobile
5. **Optimize Images**: Use different image sizes for different screen sizes
6. **Think in Percentages**: Sometimes percentage-based sizing is better than fixed adaptive values

---

## Example: Complete Responsive Screen

```dart
class ResponsiveLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: ResponsiveHelper.getContentConstraints(context),
          padding: ResponsiveHelper.padding(context, all: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/logo.png',
                height: ResponsiveHelper.adaptive(
                  context,
                  mobile: 80,
                  tablet: 100,
                  desktop: 120,
                ),
              ),
              
              SizedBox(height: ResponsiveHelper.spacing(context, 40)),
              
              // Title
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(
                    context,
                    base: 28,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: ResponsiveHelper.spacing(context, 32)),
              
              // Form fields with max width on tablets
              Container(
                constraints: ResponsiveHelper.isTablet(context) || 
                            ResponsiveHelper.isDesktop(context)
                    ? BoxConstraints(maxWidth: 400)
                    : BoxConstraints(),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: ResponsiveHelper.padding(
                          context,
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: ResponsiveHelper.spacing(context, 16)),
                    
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: ResponsiveHelper.padding(
                          context,
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                    
                    SizedBox(height: ResponsiveHelper.spacing(context, 24)),
                    
                    // Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: ResponsiveHelper.padding(
                            context,
                            vertical: 16,
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## Summary

ResponsiveHelper makes it easy to:
- ✅ Create layouts that work on all screen sizes
- ✅ Maintain consistent spacing and sizing
- ✅ Write cleaner, more maintainable code
- ✅ Follow responsive design best practices
- ✅ Test and debug responsive behavior

Remember: The goal is to create a great user experience on every device, not just to make things "fit" on the screen.