# LLM Agent Slides

A presentation project about LLM (Large Language Model) Agents.

## Quick Start

1. Open `index.html` in a browser to start the presentation
2. Use arrow keys or click left/right sides to navigate
3. Press `F` for fullscreen mode

## Project Structure

```
llm-agent-slides/
├── index.html           # Presentation controller (entry point)
├── theme-demo.html      # Theme reference and examples
├── CLAUDE.md            # Project documentation
├── styles/
│   └── theme.css        # Shared theme styles
└── slides/              # Individual slide files
    ├── 01-title.html
    ├── 02-overview.html
    └── ...
```

## Adding New Slides

1. Create a new HTML file in `slides/` folder (e.g., `04-architecture.html`)
2. Use the template below with appropriate slide class
3. Add the slide path to the `SLIDES` array in `index.html`

### Slide Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Slide Title</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Urbanist:wght@300;400;500;600;700;800&family=IBM+Plex+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../styles/theme.css">
</head>
<body>

<div class="slide slide-[TYPE]">
  <div class="slide-inner">
    <!-- Content here -->
  </div>
</div>

</body>
</html>
```

## Slide Types

Use these classes on the `.slide` element:

| Class | Description |
|-------|-------------|
| `slide-title` | Title slide with centered tag, heading, subtitle, author |
| `slide-content` | Section label, heading, lead text, 3-column cards |
| `slide-highlight` | Big number/stat, quote, centered layout |
| `slide-two-column` | Two-column layout for text + visual |
| `slide-list` | Bulleted list with icons |
| `slide-code` | Code snippet with syntax highlighting |

## Presentation Controls

| Control | Action |
|---------|--------|
| `←` `→` | Previous / Next slide |
| `Space` | Next slide |
| `F` | Toggle fullscreen |
| `Home` / `End` | First / Last slide |
| `Esc` | Exit fullscreen |
| Click left/right | Navigate slides |
| Swipe (mobile) | Navigate slides |

## Theme Specifications

### Colors
- **Background:** `#1A0B2E` (deep purple)
- **Background Primary:** `#110721` (darker purple)
- **Primary Text:** `#FFFFFF` (white)
- **Secondary Text:** `#B8A9CC` (light purple)
- **Muted Text:** `#7B6B8D` (muted purple)
- **Accent:** `#A855F7` (bright purple)
- **Accent Soft:** `#C084FC` (lighter purple)

### Typography
- **Heading Font:** Urbanist (weights: 300-800)
- **Body Font:** IBM Plex Sans (weights: 300-600)

### Design Elements
- Card backgrounds: `rgba(255,255,255,0.04)`
- Borders: `rgba(255,255,255,0.05)`
- Border radius: 10-12px (containers), 100px (tags/pills)
- Subtle glow effects using accent color
- Radial gradient overlays for depth

## Guidelines

1. Follow the established color palette and typography
2. Keep slide content focused - one main idea per slide
3. Use card components for listing features, steps, or comparisons
4. Include visual hierarchy: section labels → headings → body text
5. Maintain consistent padding (64-72px) and spacing
