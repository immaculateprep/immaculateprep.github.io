# immaculateprep.edu.jm

Website for Immaculate Conception Preparatory School, hosted free on GitHub Pages. GitHub builds the site automatically (it uses Jekyll), so there is nothing to install to publish it.

## First-time setup

1. Create a **public** repository under the school's GitHub organization and upload everything in this folder.
2. On your computer, from the repo folder, run `bash fetch-assets.sh` to pull the logo, photos and calendar PDFs from the old site, then commit and push the `assets` folder. (Or download them manually into `assets/img` and `assets/docs` using the filenames listed in the script.)
3. Repo **Settings > Pages**: Source = Deploy from a branch, branch `main`, folder `/ (root)`.
4. Organization **Settings > Pages**: add and verify `immaculateprep.edu.jm` (adds a TXT record).
5. DNS for `immaculateprep.edu.jm`:
   - A records on `@`: 185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153
   - AAAA records on `@`: 2606:50c0:8000::153, 2606:50c0:8001::153, 2606:50c0:8002::153, 2606:50c0:8003::153
   - CNAME on `www`: `<org-name>.github.io`
   - Keep the existing MX and email TXT records.
6. Once the site loads on the new domain, tick **Enforce HTTPS** in the repo's Pages settings.

## Before launch

Confirm with the school:
- the phone number in `_config.yml` (the old site displayed 925-2819 but one link dialled 924-0000)
- the kindergarten age range on the Programmes page (the old site said 3 to 5, which overlaps pre-school)
- whether the six news stories are real or template placeholders
- the event dates in `_data/events.yml` (the old site gave no year; 2026 is assumed)

Downloads: copy the curriculum PDFs and parent resources (booklists, uniform guide, fees, newsletters, policies) from the mirror's `wp-content/uploads` folder into `assets/docs`, then add each path in `_data/curricula.yml` and `_data/resources.yml`. Items without a file say "Available from the school office".

## Everyday editing (all in the GitHub website, no software needed)

- **School details** (phone, contact email, address, announcement bar, calendar link): `_config.yml`
- **Menu**: `_data/navigation.yml`
- **Leadership team**: `_data/leadership.yml`
- **Upcoming events**: `_data/events.yml` (past events hide automatically on the next update)
- **Curriculum and resource downloads**: `_data/curricula.yml` and `_data/resources.yml`
- **Page text**: the `index.html` inside each folder (`about-us`, `admissions`, and so on). Edit the words between the tags and leave the tags alone.
- **Add a news story**: create a file in `_posts` named `YYYY-MM-DD-short-title.md`, copy the top section from an existing post, change the title, category and image, and write the story below the second `---` line. It appears on the home page and the News page automatically.
- **New calendar**: upload the PDF to `assets/docs` and update `calendar_pdf` and `announcement_link` in `_config.yml`.
- **Photos**: upload to `assets/img`. Keep them under 500 KB (resize to about 1600px wide).

Changes go live about a minute after you commit.

## Previewing locally (optional)

With Ruby installed: `bundle install` then `bundle exec jekyll serve`, and open http://localhost:4000.
