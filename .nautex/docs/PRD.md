#  Product Specification
## [PRD-1] Introduction & Vision
### [PRD-2] Overview
The CrewAI Tarot Deck Generator is a web-based application designed to democratize the creation of high-quality, conceptually consistent Tarot decks. By leveraging a multi-agent AI system, the platform transforms a user's high-level creative idea into a fully realized, 78-card Tarot deck. The system separates the creative process into two distinct phases: defining a cohesive "Style Bible" and then executing the production of individual cards based on that bible.

### [PRD-3] Problem Statement
Creating a custom Tarot deck is a massive undertaking requiring deep knowledge of Tarot symbolism, consistent artistic direction, and significant time investment to produce 78 distinct yet cohesive images. Current generative AI tools often struggle with consistency across large batches of images, leading to disjointed decks that lack the "soul" or structural integrity required for actual Tarot usage.

### [PRD-4] Goals & Objectives
[PRD-5] Cohesion at Scale: Ensure all 78 cards adhere to a unified artistic and symbolic vision defined in a user-approved Style Bible. 

[PRD-6] Agentic Collaboration: Utilize specialized AI roles (e.g., Symbolist, Art Director) to mimic a real-world creative studio workflow. 

[PRD-7] Human-in-the-Loop Control: Provide users with strategic checkpoints to review, edit, and approve creative direction before expensive bulk generation occurs. 

[PRD-8] Production Readiness: Deliver assets that are not just digital images, but formatted for physical printing standards. 

[PRD-9] Scalability: Build the initial internal tool with the architectural foresight to transition into a commercial multi-tenant SaaS product. 

## [PRD-10] Target Audience & User Personas
### [PRD-11] Primary Persona: The Visionary Creator
[PRD-12] Role: Tarot enthusiasts, digital artists, or spiritual practitioners. 

[PRD-13] Motivation: Wants to bring a specific thematic concept (e.g., "Cyberpunk Noir Tarot" or "Art Nouveau Forest Animals") to life but lacks the time or manual illustration skills to draw 78 cards. 

[PRD-14] Needs: High creative control over the "vibe," assurance of Tarot accuracy, and the ability to intervene if the AI misinterprets the vision. 

### [PRD-15] Secondary Persona: The System Administrator
[PRD-16] Role: Product Owner / Internal Developer. 

[PRD-17] Motivation: Managing API costs and system performance. 

[PRD-18] Needs: Tools to monitor agent performance, handle stuck processes, and manage the transition from single-user to multi-user architecture. 

## [PRD-19] User Stories
### [PRD-20] Style Definition
[PRD-21] As a Creator, I want to input a high-level creative prompt (e.g., "A post-apocalyptic deck inspired by 1980s anime") so that the system understands my core concept. 

[PRD-22] As a Creator, I want the system to generate a "Style Bible" that details the medium, color palette, lighting, and symbolism before generating any cards, so that I can ensure the direction is correct. 

[PRD-23] As a Creator, I want to edit the generated Style Bible text directly (e.g., changing "Neon Green" to "Muted Gold"), so that I can refine the artistic direction. 

[PRD-24] As a Creator, I want to approve the Style Bible to trigger the deck generation phase. 

### [PRD-25] Deck Generation & Review
[PRD-26] As a Creator, I want to see the progress of the deck generation (e.g., "Generated 12/78 cards"), so that I know the system is working. 

[PRD-27] As a Creator, I want the system to automatically retry generating a card if it doesn't meet the Style Bible's criteria, so that I don't have to micro-manage every error. 

[PRD-28] As a Creator, I want to be notified when a card fails validation 3 times, so that I can intervene. 

[PRD-29] As a Creator, I want to manually overwrite the image prompt or force-approve a card that was flagged for review, so that the process can continue despite AI limitations. 

### [PRD-30] Export & Showcase
[PRD-31] As a Creator, I want to view my completed deck in a digital gallery, so I can admire the cohesive collection. 

[PRD-32] As a Creator, I want to export the full deck as a print-ready file (PDF or Zip) formatted for standard Tarot card dimensions, so that I can print a physical copy. 

## [PRD-33] Functional Requirements
### [PRD-34] Phase 1: Style Bible Generation
The system must employ a dedicated CrewAI flow to establish the project's creative foundation.

[PRD-35] Input Mechanism: The system must accept a text-based creative prompt from the user defining the core theme. 

[PRD-36] Agent Roles: The system must utilize the following specific AI agents for this phase: 

[PRD-37] Lead Writer: To establish the tone of voice and narrative theme. 

[PRD-38] Art Director: To define visual medium, composition rules, field of view, and lighting. 

[PRD-39] Tarot Master: To ensure the theme respects the structural integrity of the Major and Minor Arcana. 

[PRD-40] Symbolist: To define how traditional symbols are translated into the specific theme (e.g., "Swords become Laser Katanas"). 

[PRD-41] Output Structure: The agents must produce a structured "Style Bible" text document containing sections for: Medium, Color Palette, Style/Vibe, Tone, Symbolism Usage, Lighting, and Composition. 

[PRD-42] Editing Interface: The system must provide a UI for the user to review and edit the raw text of the Style Bible. 

[PRD-43] Approval Gate: The system must require explicit user confirmation ("Approve Style Bible") to lock the configuration and proceed to Phase 2. 

### [PRD-44] Phase 2: Deck Production
The system must iterate through the standard 78-card Tarot list, utilizing the approved Style Bible as the source of truth.

[PRD-45] Agent Roles: The system must utilize the following specific AI agents for this phase: 

[PRD-46] Card Concept Agent: Translates the specific card meaning (e.g., "The Fool") into a scene description based on the Style Bible. 

[PRD-47] Prompt Generation Agent: Converts the scene description into a technical image generation prompt optimized for the image model. 

[PRD-48] Image Generation Agent: Executes the prompt to create the visual asset. 

[PRD-49] Review Agent: Analyzes the generated image against the Style Bible criteria and the card concept. 

[PRD-50] Automated Quality Loop: 

[PRD-51] The Review Agent must assign a Pass/Fail status to each generated image. 

[PRD-52] If Fail: The system must trigger a retry loop where the Prompt Agent revises the prompt based on the Review Agent's feedback. 

[PRD-53] Retry Limit: The system must allow a maximum of $N_{retries} = 3$ automated attempts per card. 

[PRD-54] Human Intervention triggers: 

[PRD-55] If a card fails $3$ times, the system must flag the card as "Needs Review" and pause processing for that specific card (while continuing others). 

[PRD-56] The UI must allow the user to Manually Overwrite Prompt (edit the prompt and trigger a single generation attempt). 

[PRD-57] The UI must allow the user to Force Approve the current image, bypassing the Review Agent. 

### [PRD-58] Output & Export
[PRD-59] Gallery View: The system must display generated cards in a grid view, organized by Major Arcana and Suits (Wands, Cups, Swords, Pentacles). 

[PRD-60] Physical Dimensions: The system must generate images compatible with Standard Tarot size. 

[PRD-61] Physical Size: $2.75" \times 4.75"$ 

[PRD-62] Resolution requirement: $300 \text{ DPI}$ 

[PRD-63] Target Pixel Dimensions: $825\text{px} \times 1425\text{px}$ minimum. 

[PRD-64] File Packaging: The system must compile all 78 images into a downloadable package (Zip or PDF) for printing. 

### [PRD-65] Data Management & Scalability
[PRD-66] Data Isolation: Although currently internal, the database schema must link all decks and assets to a specific user_id to facilitate future multi-tenancy. 

[PRD-67] State Persistence: The system must save the state of generation (e.g., "Card 5/78 processing") so that the process can resume if interrupted. 

## [PRD-68] Non-Functional Requirements
### [PRD-69] Usability
[PRD-70] Progress Feedback: Given the time required to generate 78 images, the UI must provide granular progress indicators (e.g., "Generating: The Magician..."). 

[PRD-71] Clarity of Action: The difference between "Editing the Style Bible" and "Editing a specific Card Prompt" must be visually distinct to prevent user confusion. 

### [PRD-72] Reliability
[PRD-73] Async Processing: The web server must offload agent workflows to background workers to prevent request timeouts during long-generation cycles. 

[PRD-74] Error Handling: The system must gracefully handle API rate limits from underlying AI providers without crashing the user's session. 

### [PRD-75] Performance
[PRD-76] Asset Loading: The Gallery view must use lazy loading or pagination, as loading 78 high-resolution images simultaneously will degrade browser performance. 

## [PRD-77] Scope
### [PRD-78] In Scope
[PRD-79] Web Application interface (Desktop focus). 

[PRD-80] 2-Stage CrewAI Workflow (Style Bible + Deck Generation). 

[PRD-81] 8 distinct Agent Roles (Writer, Art Director, Tarot Master, Symbolist, Concept, Prompt, Image, Review). 

[PRD-82] Automated Review Loop with 3-retry limit. 

[PRD-83] Manual override capabilities (Prompt edit, Force approve). 

[PRD-84] Standard Tarot (78 cards) structure support. 

[PRD-85] Print-ready export (2.75" x 4.75" @ 300DPI). 

[PRD-86] Public Gallery (View-Only). 

### [PRD-87] Out of Scope
[PRD-88] Mobile Application (Native iOS/Android). 

[PRD-89] Social features (Likes, Comments, Follows). 

[PRD-90] "Remixing" or cloning other users' Style Bibles. 

[PRD-91] Customizing card backs (Phase 1 focus is card fronts only). 

[PRD-92] Payment processing or subscription management (Deferred to Commercial Phase). 

[PRD-93] Physical fulfillment (Printing and shipping the deck). 

## [PRD-94] Success Metrics
[PRD-95] Deck Completion Rate: The percentage of started projects that result in a fully generated 78-card deck. 

[PRD-96] $Rate = \frac{\text{Completed Decks}}{\text{Approved Style Bibles}} \times 100$ 

[PRD-97] Agent Efficiency: The average number of retries required per deck. 

[PRD-98] Goal: $< 10%$ of cards requiring the full 3 retries. 

[PRD-99] Intervention Rate: The frequency with which users must manually overwrite prompts vs. Force Approve. 

[PRD-100] Export Utility: The number of users who download the "Print-Ready" package. 

## [PRD-101] Assumptions & Dependencies
[PRD-102] Assumption: The underlying Image Generation Model is capable of adhering to the complex stylistic instructions defined in the Style Bible. 

[PRD-103] Assumption: The user has basic knowledge of Tarot structure (or trusts the Tarot Master agent implicitly). 

[PRD-104] Dependency: Reliability and availability of third-party LLM and Image Generation APIs. 

[PRD-105] Dependency: Costs for image generation are absorbed by the internal owner for the MVP phase. 
