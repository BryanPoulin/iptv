# IPTV 🇨🇦 🇺🇸 🇬🇧

Welcome to the GitHub Pages version of this project!

👉 **Live site:** [https://bryanpoulin.github.io/iptv/](https://bryanpoulin.github.io/iptv/)

This site serves the **index.html** file from the root of the `master` branch. It includes a curated list of publicly avaialble IPTV channels from Canada, the United States and the United Kingdom.

## 📺 IPTV Streams Sync and Index Build

This repository **automatically syncs** selected IPTV playlists from [iptv-org/iptv](https://github.com/iptv-org/iptv) and **builds a combined index.m3u** for easier access.

### 🔄 What happens automatically?

- **Nightly (00:00 UTC)**, a GitHub Actions workflow:
  1. Syncs the `streams/` folder with the latest playlists from `iptv-org`.
  2. Combines selected `.m3u` files (`ca.m3u`, `us.m3u`, `uk.m3u`) into a single `index.m3u` at the repository root.
  3. Commits and pushes changes if there are updates.

### 🛠️ Customization

- To change which `.m3u` files get combined in `index.m3u`, edit the `SELECTED_FILES` list in `.github/workflows/...yml`.
- To trigger the workflow manually (outside of the daily schedule), go to the "Actions" tab on GitHub and select the workflow to "Run workflow".

### ⚡ Manually sync (local)

You can manually run the sync script locally if needed:

```bash
./scripts/sync-streams.sh
```

## 🔧 Contributing

Feel free to open issues or submit pull requests to suggest improvements!

## Legal

No video files are stored in this repository. The repository simply contains user-submitted links to publicly available video stream URLs, which to the best of our knowledge have been intentionally made publicly by the copyright holders. If any links in these playlists infringe on your rights as a copyright holder, they may be removed by sending a pull request or opening an issue. However, note that we have no control over the destination of the link, and just removing the link from the playlist will not remove its contents from the web. Note that linking does not directly infringe copyright because no copy is made on the site providing the link, and thus this is not a valid reason to send a DMCA notice to GitHub. To remove this content from the web, you should contact the web host that's actually hosting the content (not GitHub, nor the maintainers of this repository).

## 📜 License

This project is licensed under the MIT License. See the [LICENSE.md](LICENSE.md) file for details.
