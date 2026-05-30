/* ── SVG icon helpers ── */
const icons = {
  mapPin: `<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12S4 16 4 10a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>`,
  mail: `<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>`,
  linkedin: `<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"/><rect width="4" height="12" x="2" y="9"/><circle cx="4" cy="4" r="2"/></svg>`,
  github: `<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4"/><path d="M9 18c-4.51 2-5-2-7-2"/></svg>`,
  orcid: `<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 256 256" fill="currentColor"><path d="M256,128c0,70.7-57.3,128-128,128C57.3,256,0,198.7,0,128C0,57.3,57.3,0,128,0C198.7,0,256,57.3,256,128z"/><g fill="var(--bg)"><path d="M86.3,186.2H70.9V79.1h15.4v48.4V186.2z"/><path d="M108.9,79.1h41.6c39.6,0,57,28.3,57,53.6c0,27.5-21.5,53.6-56.8,53.6h-41.8V79.1z M124.3,172.4h24.5c34.9,0,42.9-26.5,42.9-39.7c0-21.5-13.7-39.7-43.7-39.7h-23.7V172.4z"/><path d="M88.7,56.8c0,5.5-4.5,10.1-10.1,10.1c-5.6,0-10.1-4.6-10.1-10.1c0-5.6,4.5-10.1,10.1-10.1C84.2,46.7,88.7,51.3,88.7,56.8z"/></g></svg>`,
  externalLink: `<svg xmlns="http://www.w3.org/2000/svg" width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h6v6"/><path d="M10 14 21 3"/><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/></svg>`,
};

/* ── Date formatters ── */
function formatDate(dateStr) {
  const [day, month, year] = dateStr.split("-");
  return new Date(+year, +month - 1, +day).toLocaleDateString("en-US", {
    month: "short",
    year: "numeric",
  });
}

function formatPeriod(start, end) {
  return end
    ? `${formatDate(start)} – ${formatDate(end)}`
    : `${formatDate(start)} – Present`;
}

function formatYears(start, end) {
  return end ? `${start} – ${end}` : `${start} – Present`;
}

/* ── Render: Profile ── */
function renderProfile(data) {
  const { short_name, subtitle, personal_data } = data;
  const { contact, location } = personal_data;

  document.getElementById("navbar-name").textContent = "Curriculum Vitae";
  document.getElementById("profile-name").textContent = short_name;
  document.getElementById("footer-name").textContent =
    `© ${new Date().getFullYear()} ${short_name}`;
  document.title = short_name;

  // Subtitle from JSON
  const subtitleEl = document.getElementById("profile-subtitle");
  if (subtitle) {
    subtitleEl.textContent = subtitle;
  } else {
    subtitleEl.style.display = "none";
  }

  const emailRaw = contact.email;
  const emailHref = emailRaw.replace(" [dot] ", ".").replace(" [at] ", "@");

  const linksEl = document.getElementById("profile-links");

  const locationStr = [location.city, location.country]
    .filter(Boolean)
    .join(", ");

  const links = [
    {
      href: null,
      icon: icons.mapPin,
      label: locationStr,
    },
    {
      href: `mailto:${emailHref}`,
      icon: icons.mail,
      label: emailRaw,
    },
    {
      href: contact.linkedin.url,
      icon: icons.linkedin,
      label: "LinkedIn",
    },
    {
      href: contact.orcid.url,
      icon: icons.orcid,
      label: "ORCID",
    },
  ];

  if (contact.github) {
    links.push({
      href: contact.github.url,
      icon: icons.github,
      label: contact.github.username,
    });
  }

  links.forEach(({ href, icon, label }) => {
    if (href) {
      const a = document.createElement("a");
      a.className = "profile-link";
      a.href = href;
      if (!href.startsWith("mailto:")) {
        a.target = "_blank";
        a.rel = "noopener noreferrer";
      }
      a.innerHTML = `${icon}<span>${label}</span>`;
      linksEl.appendChild(a);
    } else {
      const div = document.createElement("div");
      div.className = "profile-link";
      div.innerHTML = `${icon}<span>${label}</span>`;
      linksEl.appendChild(div);
    }
  });
}

/* ── Render: Education ── */
function renderEducation(education) {
  const list = document.getElementById("education-list");

  education.forEach((edu) => {
    const item = document.createElement("div");
    item.className = "timeline-item";

    const dot = document.createElement("div");
    dot.className = "timeline-dot";
    item.appendChild(dot);

    const institutionLink = edu.institution.website
      ? `<a href="${edu.institution.website}" target="_blank" rel="noopener noreferrer" class="timeline-subtitle">${edu.institution.name} ${icons.externalLink}</a>`
      : `<span class="timeline-subtitle">${edu.institution.name}</span>`;

    const loc = edu.location;
    const locationStr = [loc.city, loc.state || loc.region, loc.country]
      .filter(Boolean)
      .join(", ");

    item.innerHTML += `
      <div class="timeline-header">
        <span class="timeline-title">${edu.degree} - ${edu.field_of_study}</span>
        <span class="timeline-date">${formatYears(edu.start_year, edu.end_year)}</span>
      </div>
      ${institutionLink}
      <div class="timeline-meta" style="opacity:0.7">${locationStr}</div>
    `;

    list.appendChild(item);
  });
}

/* ── Render: Experience ── */
function renderExperience(experience) {
  const list = document.getElementById("experience-list");

  const groups = [];
  experience.forEach((exp) => {
    if (
      groups.length > 0 &&
      groups[groups.length - 1][0].company.name === exp.company.name
    ) {
      groups[groups.length - 1].push(exp);
    } else {
      groups.push([exp]);
    }
  });

  groups.forEach((group) => {
    const groupEl = document.createElement("div");
    groupEl.className = "timeline-group";

    group.forEach((exp, index) => {
      const item = document.createElement("div");
      item.className = "timeline-item";

      const dot = document.createElement("div");
      dot.className = "timeline-dot";
      item.appendChild(dot);

      const companyLink = exp.company.website
        ? `<a href="${exp.company.website}" target="_blank" rel="noopener noreferrer">${exp.company.name} ${icons.externalLink}</a>`
        : exp.company.name;

      const dept = exp.position.department
        ? ` · ${exp.position.department}`
        : "";

      const hasDetails =
        (exp.tasks && exp.tasks.length) ||
        (exp.technologies && exp.technologies.length);

      const tasks =
        exp.tasks && exp.tasks.length
          ? `<ul class="task-list">${exp.tasks.map((t) => `<li>${t}</li>`).join("")}</ul>`
          : "";

      const tags =
        exp.technologies && exp.technologies.length
          ? `<div class="tag-list">${exp.technologies.map((t) => `<span class="tag">${t}</span>`).join("")}</div>`
          : "";

      const collapseChevron = `<svg class="collapse-chevron" xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="m6 9 6 6 6-6"/></svg>`;

      const collapseToggle = hasDetails
        ? `<button class="collapse-toggle" aria-expanded="false">Details ${collapseChevron}</button>`
        : "";

      const collapseBody = hasDetails
        ? `<div class="collapse-body"><div class="collapse-inner">${tasks}${tags}</div></div>`
        : "";

      const subtitleHtml =
        index === 0
          ? `<div class="timeline-subtitle">${companyLink}<span style="color:var(--muted-fg)">${dept}</span></div>`
          : `<div class="timeline-subtitle" style="color:var(--muted-fg)">${dept ? dept.substring(3) : ""}</div>`;

      item.innerHTML += `
        <div class="timeline-header">
          <span class="timeline-title">${exp.position.title}</span>
          <span class="timeline-date">${formatPeriod(exp.start_date, exp.end_date)}</span>
        </div>
        ${subtitleHtml}
        <div class="timeline-meta">${exp.location} · ${exp.position.mode}</div>
        ${collapseToggle}
        ${collapseBody}
      `;

      groupEl.appendChild(item);
    });

    list.appendChild(groupEl);
  });

  // Wire up toggle buttons after all items are in the DOM
  list.querySelectorAll(".collapse-toggle").forEach((btn) => {
    btn.addEventListener("click", () => {
      const expanded = btn.getAttribute("aria-expanded") === "true";
      btn.setAttribute("aria-expanded", String(!expanded));
      btn
        .closest(".timeline-item")
        .querySelector(".collapse-body")
        .classList.toggle("open", !expanded);
    });
  });
}

/* ── Render: Publications ── */
function renderPublications(publications, authorName) {
  const section = document.getElementById("section-publications");
  const list = document.getElementById("publications-list");

  if (!publications || publications.length === 0) {
    section.style.display = "none";
    // Also hide the divider before it
    section.previousElementSibling.style.display = "none";
    return;
  }

  publications.forEach((pub) => {
    const item = document.createElement("div");
    item.className = "pub-item";

    const authorsHtml = pub.authors
      .map((author) => {
        const isMe =
          authorName
            .toLowerCase()
            .includes(author.split(" ")[0].toLowerCase()) ||
          author.toLowerCase().includes(authorName.split(" ")[0].toLowerCase());
        return isMe
          ? `<span class="author-highlight">${author}</span>`
          : `<span>${author}</span>`;
      })
      .join(", ");

    // Magazine with hyperlink + institution without hyperlink
    const magazineName = pub.magazine.name || pub.magazine;
    const magazineWebsite = pub.magazine.website || pub.link;
    const magazineLink = magazineWebsite
      ? `<a href="${magazineWebsite}" target="_blank" rel="noopener noreferrer">${magazineName} ${icons.externalLink}</a>`
      : `<span>${magazineName}</span>`;
    const institutionPart = pub.magazine.institution
      ? `<span> - ${pub.magazine.institution}</span>`
      : "";

    const year = pub.published_date
      ? `<span>(${pub.published_date})</span>`
      : "";
    const volume = pub.volume ? `<span>Vol. ${pub.volume}</span>` : "";
    const pages = pub.page ? `<span>pp. ${pub.page}</span>` : "";

    const downloadButton = pub.link
      ? `<a href="${pub.link}" target="_blank" rel="noopener noreferrer" class="download-button">Download PDF</a>`
      : "";

    item.innerHTML = `
      <div class="pub-title">${pub.title}</div>
      <div class="pub-authors">Authored by: ${authorsHtml}</div>
      <div class="pub-meta">Published in: ${magazineLink}${institutionPart} ${year} ${volume} ${pages}</div>
      ${downloadButton}
    `;

    list.appendChild(item);
  });
}

/* ── Theme toggle ── */
function initTheme() {
  const toggle = document.getElementById("theme-toggle");
  const html = document.documentElement;

  const saved = localStorage.getItem("theme");
  if (saved) {
    html.setAttribute("data-theme", saved);
  } else if (window.matchMedia("(prefers-color-scheme: dark)").matches) {
    html.setAttribute("data-theme", "dark");
  }

  toggle.addEventListener("click", () => {
    const current = html.getAttribute("data-theme");
    const next = current === "dark" ? "light" : "dark";
    html.setAttribute("data-theme", next);
    localStorage.setItem("theme", next);
  });
}

/* ── Bootstrap ── */
fetch("static/data/me.json")
  .then((res) => {
    if (!res.ok) throw new Error("Could not load me.json");
    return res.json();
  })
  .then((data) => {
    renderProfile(data);
    renderEducation(data.education || []);
    renderExperience(data.work_experience || []);
    renderPublications(data.publications || [], data.name);
  })
  .catch((err) => {
    console.error("Failed to load profile data:", err);
  });

initTheme();
