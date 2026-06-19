
Gemini

Chat

Spark
beta
New chat
Search chats
Images
New
Videos
Library
Gems
PDF to Markdown Conversion
Troubleshooting 400 Bad Request Errors
Calculating Future Date
Budget LLM Hardware and Models
Car PPF Fitter Recommendations Northwich
San Diego Family Beach Resorts
Council Admits A49 Route Unsafe
Malformed Proxy URL Error
what does this mean: Databricks' expansion into the cybersecurity market highlights a major shift in enterprise data strategy. Centered around its general Lakehouse for Cybersecurity framework and the rollout of Lakewatch—a native, AI-driven "Agentic SIEM"—the platform marks a significant transition. To power this architecture, Databricks acquired two key cybersecurity startups: Antimatter (specialists in secure authentication and authorization for AI agents) and SiftD.ai (founded by the creator of Splunk’s Search Processing Language to bring deep expertise in large-scale detection engineering). The platform offers a comprehensive breakdown of its purpose, capabilities, market sentiment, and competitive position against traditional SIEM giants like Splunk and Microsoft Sentinel. 1. Why Customers Use the Databricks Security Lakehouse Traditional Security Information and Event Management (SIEM) platforms were built for an era of lower data volumes and human-paced threats. Customers are migrating to Databricks to address three critical historical pain points: The Economics of Ingestion (Decoupling Compute and Storage): Legacy SIEMs couple storage with compute, charging heavily on the volume of data ingested. This forces security teams to selectively filter, delete, or ignore rich but heavy telemetry (like video, chat logs, and full-fidelity PCAP data). Databricks allows companies to store petabytes of data cheaply in their own cloud object storage (S3, ADLS, GCS) using open formats (Delta Lake or Apache Iceberg) while paying for serverless compute only when running queries or AI agents—slashing costs by up to 80%. Elimination of Cross-Department Data Silos: Most enterprise data—HR records, application infrastructure logs, transaction data—already sits in a company's data lakehouse. Traditional tools require expensive, complex data duplication to correlate security alerts with business context. Lakewatch flips this by running directly on the lakehouse under a single governance layer (Unity Catalog). Security teams can instantly correlate an alert with an HR system or application log without moving data. Defending Against Machine-Speed Attacks: Attackers increasingly use automated AI agents to discover vulnerabilities and deploy exploits. The mean time to exploit has collapsed to under two days. Traditional SIEMs rely on manual triage, hand-authored rules, and slow querying. Databricks utilizes embedded AI agents to automate threat detection and incident investigation at machine speed. 2. Core Security Use Cases Organizations use Databricks' cybersecurity applications for several key operational objectives: Natural Language Threat Hunting (Genie Spaces): Using an integration with Anthropic's Claude models, security analysts can query petabytes of raw data using plain English (e.g., "Show me all failed logins from this IP across our AWS environment over the last 48 hours and map them to offboarding HR events"). The system automatically translates the query into optimized code. Context Graph Analytics (Blast Radius Impact): When an account or IP address is compromised, Databricks helps security teams build time-series knowledge graphs to map out every connected system, user, and application, accurately assessing the attack's blast radius in seconds. Custom Machine Learning Detections: Security engineering teams can build, backtest, and deploy advanced ML models directly via MLflow to track behavioral analytics, insider threats, entity risk scoring, and zero-day anomaly detection. Automated Data Normalization: Using the Open Cybersecurity Schema Framework (OCSF) and Lakeflow Connect, Databricks automates the normalization of disparate logs (AWS, Okta, Zscaler) into standardized, open-format tables upon ingestion. 3. Reviews and Industry Sentiment Because Lakewatch represents a highly disruptive entry into the enterprise security ecosystem, current sentiment balances massive enthusiasm for its architecture with pragmatic caution regarding implementation. Positive Sentiment (The "Data First" Approach): Large enterprise customers like HSBC, Adobe, Dropbox, and Akamai praise the sheer performance and economic relief. Case studies note that complex analytics queries that previously took hours on legacy databases execute on Delta Lake in under 7 seconds. Security leaders appreciate the "zero vendor lock-in" approach of owning their data in open formats. Constructive/Cautious Sentiment: Cybersecurity practitioners note that shifting to a security lakehouse requires adopting a "SOC-as-code" (Security Operations Center) mindset. For teams accustomed to plug-and-play graphical interfaces, the platform demands a higher degree of data engineering maturity. It yields the highest return on investment for organizations that are already heavily committed to a cloud data lakehouse architecture. 4. Analysis: Databricks vs. Major SIEM Competitors FeatureTraditional SIEM (e.g., Splunk)Cloud-Native SIEM (e.g., Microsoft Sentinel)Databricks Lakewatch (Agentic SIEM)Pricing ModelHeavy ingestion-based licensing fees; highly expensive at scale.Usage-based (pay for data analyzed/retained in Azure).Decoupled compute/storage; store data in your own bucket at raw cloud storage costs.Data Control & OwnershipLocked into proprietary indexing formats and vendor ecosystems.Locked into the vendor's cloud ecosystem (Azure log analytics).Fully open formats (Delta Lake/Apache Iceberg/OCSF); zero vendor lock-in.AI Capabilities"Bolt-on" AI features or manual rule-based correlation.Mature AI integration via Microsoft Copilot for Security (optimized for Microsoft ecosystems).Native "Agentic" workflows utilizing Anthropic's Claude for automated autonomous triage and natural language hunting.Cross-Data VisibilitySiloed strictly to whatever security logs are manually forwarded.Strong across Microsoft 365 and Azure; costly and complex for third-party/multi-cloud data.Complete native access to all enterprise business, IT, and security data sitting on the lakehouse.vs. Splunk: Splunk remains the enterprise gold standard for customization and mature dashboards, but its Total Cost of Ownership (TCO) at petabyte scale is punitive. Databricks poached Splunk's core search processing dna (via SiftD.ai) to offer a cheaper alternative that addresses Splunk's biggest structural flaw: storage pricing. vs. Microsoft Sentinel: Sentinel shines inside pure Microsoft environments. However, for organizations with heavily multi-cloud (AWS, GCP) infrastructure, third-party log ingestion into Sentinel becomes unpredictably expensive. Databricks provides a genuinely cloud-agnostic platform. 5. Future Outlook: Will this change the world of security? Databricks' move into cybersecurity is highly indicative of where enterprise security is heading. It will likely be a foundational factor in the security landscape for several reasons: The Rise of "Agentic SecOps": As hackers deploy AI bots to coordinate rapid, multi-stage intrusions, human teams cannot keep up. The industry must move toward an era where "defensive AI agents fight offensive AI agents." By baking Anthropic's reasoning models directly into the data plane, Databricks is setting the standard for autonomous, machine-speed defense. The Shift to Open Security Lakes: Security platforms are increasingly expected to separate the application layer from the data layer. Databricks is driving a major ecosystem movement (backed by its Open Security Lakehouse Ecosystem partners like Wiz, Palo Alto Networks, Okta, and Zscaler) where security vendors no longer store your data in their proprietary silos. Instead, they act as apps running on top of your unified security lake. Ultimately, Databricks is positioned to redefine the SIEM market by forcing legacy vendors to rethink their restrictive ingestion-based pricing and closed-data architectures.
Databricks Lakehouse for Cybersecurity
Secure GCP Provisioning with AI Skills
Convert USD to GBP for Subtraction
GT7: Best Hot Hatch Comparison
Building an Agentic Finance Platform
Designing an Agentic Stock Trading System
AI Governance and Architecture Challenges
Scheduled Tasks Not Running Automatically
SOAR Case Merge Event Attribution
Google SecOps UEBA Risk Analytics Tuning
VirusTotal GTI in YARA-L Rules
Databricks vs. Google SecOps Comparison
Double Compression Bloats Data
Alphabet Stock Shelf Registration Explained
Phishing Triage SOAR Workflow Overview
Playbook Workflow Request Denied
Cloud Identity Sync Health Alerts Setup
Google OAuth Proxy Callback URL Fix
Fix GCP Logs Email Mapping
Labour's Future: Blair vs. Starmer
How to Collect Chrome HAR File
Ask Gemini SOAR 503 Errors
AI Runbook Rubric Purpose Explained
Data Transfer Calculation: MB/s to TB
Tax-Efficient Relocation for UK Expats
Petabytes Per Day Calculation
Finding Apple Books Files on Mac
British Airways Seat Reservation Policy
AI Safety CV Generation from Experience
Custom Fields in Google SecOps Dashboards
Deploying Agentic SOC Gemini Enterprise
Tuning Google SecOps UEBA Risk Analytics
Configure GCP Data Access Logs
GCP Logging Query Breakdown
Accessing SecOps BigQuery Via OAuth
BigQuery Connection Error Details
List Service Accounts in Project
UK Oil Sanctions: Refined Products Clarification
SentinelOne Log Differences Explained
Finding Login Events in Google SecOps
Theom.ai Company Research Plan
Detection Skill vs. Lookback Windows
Linux Kernel Privilege Escalation Vulnerability
Netgear WiFi Extension Options
Power BI BigQuery Authentication Hybrid Model
Insufficient Authentication Scopes Error
DDJ-400 Rekordbox Tidal FX Mapping
San Diego Family Beach Hotel Recommendations
Create GCP Service Account for SecOps
Export Project User Emails via gcloud
Elantra GR4 Barcelona Aero Setup
Resetting Nest Cams for New Wi-Fi
I am syncing AD and Okta to GCP cloud identity. So any groups created will be synced to google dloud identity, however the groups are not passed through cloud identity when mapping to GCP IAM
Fixing Admin Session Command Errors
GCP Go-Live Support Plan Confirmation
Looking at google threat intelligence and ASM in particular how can it address the customers questions below. Documentation here: https://gtidocs.virustotal.com/docs/get-started-asm **Original customer question** Hi Steven,   Hope you’re well. My name’s Damien Townsend I work within incident response at WTW, I’ve been looped in as part of a wider operational effort looking at internet‑facing exposure across the estate, and I wanted to reach out directly.   We’re currently focused on enumerating and validating externally exposed web services across standard and non‑standard ports, including discovery of sub‑domains and assets surfaced through both passive and active reconnaissance. A key concern is identifying cases where unauthenticated access allows enumeration or exposure of files, folders, or other artifacts (for example IIS directory listing or equivalent behaviours), across a range of web technologies.   We are already using Google Threat Intelligence as part of this work. What we’d like to understand now is whether GTI, or any other Google/Mandiant tooling, can actively assist with the discovery and identification phase. It would be useful to understand: Whether GTI includes datasets or capabilities that can help surface internet‑facing web services or assets, including those not well captured in existing inventories Whether GTI or related Mandiant platforms can contribute signal around potential directory listing or similar exposure patterns Any tools, techniques, or analytical approaches your team typically applies to help customers uncover this type of external web exposure at scale Whether there are other relevant Google/Mandiant capabilities that we should be leveraging for this use case   The aim is to ensure we are making full and effective use of the capabilities available to us, and to understand where you’re tooling or experience can help accelerate or strengthen our discovery efforts.
Optimizing Home Network Performance and Security
Querying Google SOAR Integration Logs
Securing Chronicle API Permissions
I get this 403 error when trying to push an event to a SIEM webhook's API :importPushLogs from the SOAR IDE. The API Key and Secret have the proper permissions since I can successfully execute the function locally on my host. It just seems to not like it when I try to push logs to the SIEM from the SOAR IDE. Any thoughts on how I can resolve this issue or is this intended? (Working on building a custom integration) {   "error": {     "code": 403,     "message": "The caller does not have permission",     "status": "PERMISSION_DENIED"  }
Google Threat Intelligence for Web Exposure
Assigning Cases in Google SecOps
PDF to Google Doc Conversion
Refactor Data Export API v2

Activity
Weaverham, UK
From your IP address
Update location
Conversation with Gemini
cretae a markdown file from this PDF

Your Markdown file is ready
MD icon
gt7_tuning_cheat_sheet_flux89
 MD 
Open

I have extracted the complete text from the provided PDF, stripped out the internal line number tags (``), and beautifully structured it into clean Markdown syntax using proper headers, lists, bullet points, and tables. You can download and use the file above.




Your Google chats aren't used to improve our models. Gemini is AI. It can make mistakes, so double-check it. Your privacy and GeminiOpens in a new window

# FLUX89 GT7 TUNING CHEAT SHEET v1.2
**The Complete Gran Turismo 7 Tuning Cheat Sheet**
*Every Setting Explained | Baseline Values for Every Car | Troubleshooting Fixes*

Values validated against in-game data. Free resource for the GT7 community. Share freely.
YouTube: [youtube.com/@flux89sim](https://youtube.com/@flux89sim)

---

## How to Use This Guide
This guide gives you a complete baseline tune for any car in GT7. It works for road cars, race cars, engine-swapped builds, and everything in between.

* **Step 1:** Follow the tuning order on the next page. Each setting builds on the one before it.
* **Step 2:** Use the starting values tables in each section. Some settings (dampers, ARBs, LSD) use the same scale on every car. Others (springs, ride height) vary per car, so we give slider position guidance instead.
* **Step 3:** Drive 3-5 laps. Something feel wrong? Jump to the Troubleshooting section.
* **Step 4:** Make ONE change at a time. Test again. Repeat until it feels right.

### Before You Start: Buy These Parts
You need these parts from GT Auto to access all tuning settings:
* **Fully Customizable Suspension** - unlocks ride height, springs, dampers, ARBs, camber, and toe.
* **Fully Customizable LSD** - unlocks all 3 differential parameters (scale: 5-60). Often lowers PP vs other diff types.
* **Fully Customizable Racing Transmission (optional)** - unlocks individual gear ratios and fastest shift times.

### Important: Ranges Vary Per Car
GT7 gives different cars different tuning ranges. For example:

| Setting | Lightweight Road Car | Sports Road Car | Gr.3 Race Car |
| :--- | :--- | :--- | :--- |
| NF front | 1.20 - 3.10 Hz | 1.40 - 3.30 Hz | 3.00 - 5.00 Hz |
| Ride height front | 80 - 180 mm | 80 - 175 mm | 55 - 80 mm |
| Dampers (comp) | 20 - 40 | 20 - 40 | 20 - 40 |
| ARBs | 1 - 10 | 1 - 10 | 1 - 10 |
| LSD (all) | 5 - 60 | 5 - 60 | 5 - 60 |

Notice that dampers, ARBs, and LSD use the same scale on every car. We give exact numbers for those. Natural frequency and ride height vary hugely, so we give slider position guidance (e.g., "start at midpoint") that works regardless of your car's range.

**PRO TIP:** Save your settings sheet before every change. Name them descriptively. You will want to revert when experiments fail.

---

## The Tuning Order
Every setting depends on the ones before it. The sections in this guide follow this exact sequence:

| Step | Category | Why This Order |
| :--- | :--- | :--- |
| 0 | Tires | Everything depends on grip level. Pick compound first |
| 1 | Downforce / Aero (Section 1) | Sets how much load suspension handles at speed |
| 2 | Ride Height (Section 2) | Establishes center of gravity and suspension travel |
| 3 | Natural Frequency (Section 3) | Springs must match ride height to avoid bottoming out |
| 4 | Anti-Roll Bars (Section 4) | Fine-tunes mid-corner balance after springs are set |
| 5 | Dampers (Section 5) | Controls weight transfer speed |
| 6 | Camber (Section 6) | Optimizes tire contact based on final geometry |
| 7 | Toe (Section 7) | Last alignment adjustment; causes tire wear if overdone |
| 8 | LSD / Differential (Section 8) | Controls driven-wheel behavior under power and braking |
| 9 | Transmission (Section 9) | Track-specific gearing, doesn't affect balance |
| 10 | Brake Balance (Section 10) | Adjustable mid-race, so tune it last |

**GOLDEN RULE:** Change one setting at a time. Drive 3-5 laps to evaluate.

---

## 1. Aerodynamics (Downforce)
### What It Does
Downforce pushes the car into the road at speed, increasing grip without adding weight. Install aero parts (front splitter, rear wing) in GT Auto, then adjust levels in the Tuning Shop. Set this first because it determines how much load your suspension must handle.

The rear wing generates far more force than the front splitter at equal settings. Setting both to the same number produces a rear-heavy aero balance.

### The Three Constants
Your tune rests on three values the car always reverts to: (1) weight distribution, (2) front ride height, and (3) downforce balance. These are your foundation.

### Approach by Track Type
| Track Speed | Front Downforce | Rear Downforce | Examples |
| :--- | :--- | :--- | :--- |
| Low-Speed | 70-80% of range | 90-100% of range | Tsukuba, Laguna Seca |
| Mid-Speed | 40-60% of range | 55-75% of range | Suzuka, Fuji, Goodwood |
| High Speed | 10-30% of range | 20-40% of range | Monza, Spa, Le Mans, Daytona |

* The speed penalty in GT7 is often surprisingly small while cornering gains are substantial.
* Positive rake (rear higher than front) can generate additional rear grip through ground effect. More rake = more rear grip at speed but more oversteer.

**PRO TIP:** If adding significant downforce, you will need stiffer springs (Section 3) to prevent bottoming out.
**WARNING:** No aero parts installed? Skip this section entirely. Your car relies on mechanical grip alone.

---

## 2. Ride Height
**WARNING:** In GT7, if you lower the car too much the wheels can physically rub the wheel arches. When this happens, the car will refuse to turn - severe understeer that no other setting can fix. If the car suddenly won't turn mid-corner, especially over bumps or curbs, raise your ride height before changing anything else.

### What It Does
Ride height (mm) sets how high the car sits. Lower = lower center of gravity = less body roll = more grip. But too low and you bottom out or wheels rub the arches.

**RANGES VARY HUGELY:** A road car might have 80-180 mm of range. A Gr.3 race car might only have 55-80 mm front and 60-90 mm rear. The same mm value means completely different things on different cars. Use slider position, not absolute numbers.

### The Key Concept: Rake
Rake means the rear sits higher than the front. This is your biggest handling variable in ride height.

| Rake | Effect |
| :--- | :--- |
| Front lower than rear (positive) | Promotes rotation and oversteer. Preferred for circuit racing |
| Front = rear (zero) | Neutral balance. Good starting point for beginners |

### Starting Position
Start with the front 3-5 clicks above your car's minimum, and the rear 5-8 clicks above minimum. This creates positive rake. The approach is identical regardless of car type or tire compound; the car's range already accounts for the difference between a road car (80-180mm) and a race car (55-80mm).

The pattern is the same regardless of car class: start low with a small amount of positive rake. The exact mm will differ per car but the approach is identical.
* **Adjust for track surface:** Add 2-3 extra clicks on bumpy tracks (Nordschleife) - test and revisit. Flat tracks (Fuji, Daytona) can go lower.

### How It Affects Handling
| Change | Effect |
| :--- | :--- |
| Raise the front | Generates understeer - harder to turn in |
| Raise the rear | Generates oversteer - rear rotates more |
| Lower both equally | More grip, less body roll, risk bottoming out or arch rub |

**PRO TIP:** Lowering ride height produced the biggest lap time improvement in community testing. Go as low as you can without wheel arch rubbing.
**WARNING:** If you change ride height, re-check natural frequency. Lower height = less travel = may need stiffer springs.

---

## 3. Natural Frequency (Spring Rate)
### What It Does
Natural frequency (Hz) controls spring stiffness. GT7's Hz system already accounts for the car's weight. The available range varies per car; a lightweight road car might offer 1.20 to 3.10 Hz, while a Gr.3 race car might offer 3.00 to 5.00 Hz.

**IMPORTANT - THE REAR OFFSET:** GT7 builds in a natural rear offset. On the same car, the rear range starts and ends higher than the front (e.g., front 1.20-3.10, rear 1.35-3.25). This means if you set both sliders to the same relative position, the rear is already slightly stiffer. This is by design and promotes rotation.

### Starting Position by Tire Compound
"Same slider position" means if you set the front to its midpoint, set the rear to its midpoint too. The game's built-in offset ensures the rear is naturally stiffer. If you want more rotation, move the rear 1-2 clicks stiffer relative to the front.

| Tire Compound | Front NF Position | Rear NF Position |
| :--- | :--- | :--- |
| Comfort: Hard | Around 25-30% of your range | Same slider position (rear is already offset) |
| Comfort: Medium | Around 30-35% of your range | Same slider position |
| Comfort: Soft | Around 35-40% of your range | Same slider position |
| Sports: Hard | Around 40-45% of your range | Same slider position |
| Sports: Medium | Around 45-50% of your range (midpoint) | Same slider position |
| Sports: Soft | Around 55-60% of your range | Same slider position |
| Racing: Hard | Around 60-65% of your range | Same slider position |
| Racing: Medium | Around 65-75% of your range | Same slider position |
| Racing: Soft | Around 75-85% of your range | Same slider position |
| Racing: Intermediate | Around 40-45% of your range | Same slider position |
| Racing: Heavy Wet | Around 30-35% of your range | Same slider position |

### Quick Adjustments
| Symptom | Fix |
| :--- | :--- |
| Understeer | Soften front NF or stiffen rear NF (1-2 clicks at a time) |
| Oversteer | Stiffen front NF or soften rear NF |
| Bouncing | Springs too soft - raise NF a few clicks |
| Bottoming out | Raise NF or raise ride height |

* **Heavy cars (>1500 kg):** Move 1-2 clicks stiffer.
* **Light cars (<900 kg):** Move 1-2 clicks softer.
* **Bumpy tracks:** Move 2-3 clicks softer. If you set significant downforce in Section 1, go stiffer to handle the extra load.

**PRO TIP:** On road cars the maximum NF is often lower than on race cars. Don't worry if your road car can't reach the same stiffness as a Gr.3 - that's normal and expected.

---

## 4. Anti-Roll Bars (ARBs)
### What It Does
ARBs resist body roll in corners. GT7 uses a 1-10 scale on all cars (higher = stiffer = flatter car). ARBs only act during cornering - no effect on straight-line bumps or braking.

### How ARBs Affect Handling
| Change | Effect |
| :--- | :--- |
| Stiffen front ARB | Less front grip > more understeer |
| Soften front ARB | More front grip > less understeer |
| Stiffen rear ARB | Less rear grip > more rotation / oversteer |
| Soften rear ARB | More rear grip > less oversteer |

### Starting Values by Drivetrain
| Drivetrain | Front | Rear | Logic |
| :--- | :--- | :--- | :--- |
| FR | 6 | 4 | Stiffer front for stability, rear free to rotate |
| FF | 4 | 6 | Stiffer rear combats natural FF understeer |
| MR/RR | 6 | 3 | Stiffer front tames entry oversteer |
| AWD | 5 | 5 | Balanced, then adjust for track |

These values work across all car types.
* **Racing tires:** Add 2 to both ends.
* **Heavy cars (>1500 kg):** Add 1 to both ends.

**WARNING:** Too stiff = inside wheel lifts off in corners. Watch replays - if you see daylight under the inside tire, soften that end.
**PRO TIP:** Start understeering, then tune toward oversteer. Easier to add rotation than remove it.

---

## 5. Dampers
### What It Does
Springs decide how much the car moves; dampers control how fast.
* **Compression:** How fast it squashes down (scale: 20-40).
* **Expansion / Rebound:** How fast it bounces back up (scale: 30-50).

These scales are the same on every car in GT7.

### Starting Values
| Setting | Scale | Start Value | Notes |
| :--- | :--- | :--- | :--- |
| Front Compression | 20-40 | 28-30 | Nose dive + bump absorption. Lower = better over curbs |
| Rear Compression | 20-40 | 28-30 | Rear squat under accel. Too high = breaks traction |
| Front Expansion | 30-50 | 38-40 | How quickly front rises. Must be higher than compression |
| Rear Expansion | 30-50 | 38-40 | How quickly rear rises. Too high = rear hops under braking |

**CARDINAL RULE:** Expansion must ALWAYS be higher than compression. The game enforces this through the scale ranges: compression 20-40, expansion 30-50. A starting pair of comp 30 / exp 40 puts you at midpoint for both.

### What Each Damper Controls
| Increase This... | To Reduce This... |
| :--- | :--- |
| Front compression | Entry oversteer (nose dives too fast) |
| Front expansion | Mid/exit understeer (front lifts too slowly) |
| Rear compression | Exit understeer (rear squats too much) |
| Rear expansion | Entry/mid oversteer (rear lifts too fast) |

* **Bumpy tracks:** Drop compression 2-3 clicks toward minimum.
* **Endurance:** Drop all values 1-2 clicks for consistency.

**PRO TIP:** If you stiffen springs, soften dampers slightly. Stiff springs + stiff dampers = the car hops over bumps.

---

## 6. Camber
### What It Does
Negative camber means the top of the wheel leans inward. In corners, body roll pushes the outside wheel outward - camber compensates, keeping the tire flat on the road at the apex. Goal: match camber to body roll so the tire sits perpendicular at the apex.

In GT7, front camber primarily affects mid-corner grip rather than initial turn-in. More front camber = more front grip through the corner.

### Starting Values
| Tire Compound | Front Camber | Rear Camber |
| :--- | :--- | :--- |
| Comfort: Hard / Medium / Soft | -0.8 to -1.5 deg | -0.5 to -1.0 deg |
| Sports: Hard / Medium / Soft | -1.5 to -2.0 deg | -1.0 to -1.5 deg |
| Racing: Hard / Medium / Soft | -2.0 to -2.5 deg | -1.5 to -2.0 deg |
| Racing: Intermediate / Heavy Wet | -1.0 to -1.2 deg | -0.5 to -0.8 deg |

* Front camber should generally equal or exceed rear for FR, MR, and RR cars. More front camber = more front cornering grip through mid-corner.
* **Exception:** FF/AWD may run higher rear camber to help the rear rotate.
* **Endurance:** Reduce camber 0.3 deg both ends to preserve tires. Too much camber wears the inside edge.

**PRO TIP:** Soften springs or ARBs (more body roll) = increase camber. Stiffen them (less roll) = you can reduce camber.

---

## 7. Toe Angles
### What It Does
Toe = whether wheels point inward (toe-in, positive) or outward (toe-out, negative). Any deviation from zero causes tire scrub. Toe is the last alignment adjustment and changes should be tiny.

### Starting Values
| Setting | Value | What It Does |
| :--- | :--- | :--- |
| Front Toe | 0.00 deg (neutral) | Toe-out sharpens turn-in but adds wear. Start neutral |
| Rear Toe | +0.05 deg (slight toe-in) | Stabilizes the rear in straight lines |

* **Short wheelbase** (Mini, Fiat 500, Copen): Increase rear to +0.08 or +0.10 deg.
* **Long wheelbase** (NSX, LFA): Can use +0.03 deg.
* **Endurance:** Minimize toe toward zero. Toe is the biggest tire-wear factor in alignment.

**WARNING:** Do NOT use toe to fix handling problems that springs, ARBs, or LSD should fix. Toe is a scalpel, not a sledgehammer.

---

## 8. LSD (Limited Slip Differential)
### What It Does
The LSD controls power sharing between left and right driven wheels. All three parameters use a 5-60 scale on every car. Higher values lock wheels together (stability, traction). Lower values let them spin independently (rotation, agility). You MUST buy the Fully Customizable LSD from GT Auto.

### The Three Parameters
* **Initial Torque (5-60):** Always-on locking force. Low (5-10) = snappy transitions. High (15+) = smooth but adds understeer. Start at 5.
* **Acceleration Sensitivity (5-60):** Wheel locking under throttle. Your corner exit knob. Higher = more traction but less rotation.
* **Braking Sensitivity (5-60):** Wheel locking under braking/coasting. Your corner entry knob. Higher = stable entry but more understeer.

### Starting Values by Drivetrain
| Drivetrain | Init. Torque | Accel | Braking | Notes |
| :--- | :--- | :--- | :--- | :--- |
| FR | 5-10 | 20-35 | 5-15 | Balanced. Low braking for turn-in |
| FF | 5-15 | 25-40 | 5-10 | High accel prevents inside wheel spin |
| MR | 5-8 | 10-20 | 15-30 | Low accel avoids snap. High braking stabilizes entry |
| RR | 5-10 | 10-20 | 20-35 | Like MR but more braking sensitivity |

### AWD Settings
| AWD Section | Init. Torque | Accel | Braking |
| :--- | :--- | :--- | :--- |
| Front LSD | 5-7 | 5-15 | 5-10 |
| Rear LSD | 5-11 | 15-25 | 5-14 |
| Center Split | 30% front / 70% rear | | |

Keep front LSD open (low) to preserve turn-in. The rear LSD handles traction.

**PRO TIP:** Tune suspension FIRST, then LSD. Get the car balanced mechanically before touching the diff.
**Common mistake:** Setting everything to maximum creates massive understeer and dangerous snap oversteer. Adjust 2-5 points at a time.

---

## 9. Transmission
### Step-by-Step Setup
1.  Set **Final Drive** all the way RIGHT (shortest ratio).
2.  Move **Top Speed** slider all the way LEFT (lowest speed).
3.  Move **1st gear** all the way LEFT (longest ratio - prevents wheelspin).
4.  Space remaining gears evenly, getting closer together at the top end.
5.  Back out and adjust **Final Drive** LEFT until you reach desired top speed.
6.  **Test:** Hit redline at the end of the longest straight, just before braking.

**WARNING:** Changing the Top Speed slider RESETS all individual gear adjustments. Always set top speed BEFORE touching individual gears.
* **Lower gears (1st-3rd):** Wide spacing for acceleration.
* **Upper gears (4th-6th+):** Closer together to stay in the power band.
* **Final drive influences engine braking:** Higher number = more engine brake (tight tracks). Lower number = less (flowing tracks).

---

## 10. Brake Balance
Determines front vs rear braking force. GT7 defaults to slight front bias.

| Drivetrain | Adjustment | Why |
| :--- | :--- | :--- |
| FR | Default or 1 click rear | Improves trail braking rotation |
| FF | 1-2 clicks rear | Frees front tires for steering while braking |
| MR/RR | 1 click front | Prevents rear locking under braking |
| AWD | Default | Generally balanced as-is |

**PRO TIP:** Brake balance is adjustable mid-race via the MFD. Shift rearward as front tires wear.

---

## Troubleshooting Quick Reference
Diagnose using the 3 W's: **WHAT** is happening? **WHERE** on the corner (entry / apex / exit)? **WHEN** during your inputs (braking/coasting / throttle)?

### Car Understeers (Won't Turn In)
1. Soften front ARB or stiffen rear ARB (ARBs)
2. Soften front NF by 1-2 clicks (Springs)
3. Increase front camber by 0.5 deg (Camber)
4. Increase front downforce / reduce rear (Aero)
5. Move brake balance rearward (Brakes)
6. Reduce LSD initial torque (Diff)

### Car Oversteers (Rear Slides Out)
1. Stiffen front ARB or soften rear ARB (ARBs)
2. Soften rear NF by 1-2 clicks (Springs)
3. Increase rear downforce (Aero)
4. Reduce LSD accel sensitivity by 5 (Diff)
5. Add rear toe-in (+0.05 deg) (Toe)
6. Move brake balance forward (Brakes)

### Car Is Too Stiff / Bouncy
1. Reduce NF 2-3 clicks both ends (Springs)
2. Reduce compression damping toward 24-26 (Dampers)
3. Soften ARBs by 1-2 (ARBs)
4. Raise ride height 2-3 clicks (Ride Height)

### Car Is Too Soft / Wallowy
1. Increase NF 2-3 clicks both ends (Springs)
2. Stiffen ARBs by 1-2 (ARBs)
3. Increase compression damping toward 34-36 (Dampers)
4. Lower ride height 2-3 clicks (Ride Height)

### Unstable Under Braking
1. Move brake balance forward (Brakes)
2. Increase LSD braking sensitivity by 5 (Diff)
3. Add rear toe-in (+0.05 deg) (Toe)
4. Increase rear expansion toward 42-44 (Dampers)
5. Reduce rake (equalize ride heights) (Ride Height)

### Losing Traction on Corner Exit
1. Check tire indicators: inside spinning = increase LSD accel, outside = decrease (Diff)
2. Soften rear springs 1-2 clicks (Springs)
3. Lower rear compression toward 26-28 (Dampers)
4. Lengthen lower gear ratios (Transmission)
5. Increase traction control by 1-2 (Assists)

### Poor Straight-Line Stability
1. Add rear toe-in (+0.05 to +0.10 deg) (Toe)
2. Remove front toe-out (set to 0.00 deg) (Toe)
3. Increase rear downforce (Aero)
4. Reduce excessive negative camber (Camber)

### Excessive Tire Wear
1. Reduce toe toward neutral on both ends (Toe)
2. Reduce camber on wearing end by 0.3 deg (Camber)
3. Soften ARBs on the wearing end (ARBs)
4. Reduce LSD accel sensitivity by 5 (rear wear) (Diff)
5. Shift brake balance away from wearing end (Brakes)

### Car Bottoms Out
1. Raise ride height 2-3 clicks on affected end (Ride Height)
2. Stiffen NF 2-3 clicks (Springs)
3. Increase compression toward 34-36 (Dampers)
4. Reduce downforce if very high (Aero)

### Car Hops Over Curbs
1. Lower compression toward 24-26 (Dampers)
2. Lower expansion toward 34-36 (Dampers)
3. Soften ARBs by 1-2 (ARBs)
4. Raise ride height 1-2 clicks (Ride Height)

---

## Master Baseline Values
Print this section and keep it next to your TV. These work across all car types.

### Universal Settings (Same Scale on Every Car)
* **Front Compression (20-40):** 30 (midpoint)
* **Rear Compression (20-40):** 30 (midpoint)
* **Front Expansion (30-50):** 40 (midpoint)
* **Rear Expansion (30-50):** 40 (midpoint)
* **Front ARB (1-10):** 4-6 (depends on drivetrain)
* **Rear ARB (1-10):** 3-6 (depends on drivetrain)
* **Front Camber (varies):** -1.5 to -2.0 deg (Sports tires)
* **Rear Camber (varies):** -1.0 to -1.5 deg (Sports tires)
* **Front Toe (varies):** 0.00 deg (neutral)
* **Rear Toe (varies):** +0.05 deg (slight toe-in)

### Per-Car Settings (Use Slider Position)
* **Natural Frequency (front):** Sports tires: midpoint. Racing tires: 70-80% of range.
* **Natural Frequency (rear):** Same slider position as front (built-in offset handles the rest).
* **Ride Height (front):** 3-5 clicks above minimum.
* **Ride Height (rear):** 5-8 clicks above minimum (creates positive rake).

### LSD by Drivetrain (Scale: 5-60 on All Cars)
| Layout | Init. Torque | Accel Sens. | Braking Sens. |
| :--- | :--- | :--- | :--- |
| FR | 5 | 25 | 10 |
| FF | 10 | 35 | 8 |
| MR | 5 | 15 | 20 |
| RR | 5 | 15 | 25 |
| AWD Front | 5 | 10 | 5 |
| AWD Rear | 8 | 20 | 10 |
| AWD Center | 30/70 | | |

---

## GT7 Tips Every Beginner Should Know
* **Tires need warm-up laps.** Racing tires are slow when cold. Wait 2 laps before judging your tune.
* **Permanent mods are permanent.** Weight reduction and body rigidity cannot be removed. Keep a duplicate car.
* **ECU vs Power Restrictor.** ECU reduces power evenly (preserves curve). Restrictor kills top end but keeps low-end punch for exits.
* **Wheel arch rubbing kills turn-in.** If the car suddenly won't turn mid-corner, ride height is too low. Raise it first.
* **PP uses AI simulation.** PP doesn't always match real performance. Trust your lap times, not the number.
* **Controller vs wheel doesn't change the tune.** Core suspension and diff values are identical. Wheel users may reduce assists.
* **Fully Customizable LSD can lower PP.** Vs other diff types, it sometimes costs fewer PP points. Free performance.
* **Tuning ranges vary per car.** A road car and a Gr.3 have completely different NF and ride height ranges. Use slider positions, not absolute numbers, when following guides online.
* **Save settings constantly.** Name them descriptively. You will break things and need to revert.

---

## Glossary
* **Natural Frequency (Hz):** How stiff your springs are. Higher = stiffer. Range varies per car.
* **Ride Height (mm):** How high the car sits. Range varies per car.
* **Rake:** Rear higher than front. More = more rotation.
* **Anti-Roll Bar (1-10):** Stops leaning in corners. Higher = flatter.
* **Compression Damper (20-40):** Controls how fast suspension squashes down.
* **Expansion / Rebound (30-50):** Controls how fast it bounces back up.
* **Camber (deg):** Wheel lean. More negative = more mid-corner grip.
* **Toe-In/Toe-Out (deg):** Wheels point inward (stability) or outward (turn-in).
* **LSD (5-60):** Power sharing between left/right driven wheels.
* **Initial Torque:** LSD's always-on locking force.
* **Accel Sensitivity:** How much wheels lock under throttle.
* **Braking Sensitivity:** How much wheels lock under braking.
* **Understeer:** Car pushes wide, won't turn enough.
* **Oversteer:** Rear slides out, car turns too much.
* **Contact Patch:** Part of the tire touching the road.
* **Downforce:** Force pushing car down at speed.
* **PP:** GT7's speed rating for race restrictions (Performance Points).
* **Trail Braking:** Braking while turning in (advanced technique).
* **Venturi / Ground Effect:** Air suction under the car pulls it down.

---
*Cross-referenced with: FILO Engineering, DG EDGE, Coach Dave Academy, GTPlanet.*
gt7_tuning_cheat_sheet_flux89.md
Displaying gt7_tuning_cheat_sheet_flux89.md.