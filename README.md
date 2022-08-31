# pvillaverde/selfoss-docker-image
[![GitHub license][license-shield]][license-url] 

![selfoss](https://i.imgur.com/8hJyBgk.png "selfoss")

<!-- TABLE OF CONTENTS, generated with gh-md-toc README.md (see #acknowledgements) -->



<!-- ABOUT THE PROJECT -->
## About The Project

This is a docker container image for the [Selfoss RSS Reader](https://selfoss.aditu.de/).

### Features

- Based on PHP 7.4 image with Apache.
- Custom Selfoss Version (Stable or Development)
- SQLite driver

### Build-time variables

- **CHANNEL** = Selfoss version channel (STABLE or DEVELOPMENT)
- **VERSION** = Selfoss version
- **SHA256_HASH** = SHA256 hash of selfoss archive

### Environment variables

| Variable | Description | Type | Default value |
| -------- | ----------- | ---- | ------------- |
| **CRON_PERIOD** | Cronjob period for updating feeds | *optional* | 15m



<!-- GETTING STARTED -->
## Getting Started

### Run image

### docker-compose.yml

```yml
selfoss:
  container_name: selfoss
  image: pvillaverde/selfoss
  volumes:
    - /mnt/docker/selfoss:/var/www/html/data
```


<!-- CONTRIBUTING -->

## Support & Contributing

If you want to add any missing feature or report a bug, you [can request ir or report it here][issues-url]. Also if you are want and know how to do it, go ahead! That's what make the open source community shines, by allowing us to grow and learn from each other creating amazing tools! Any contribution you make is **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Authors

- Pablo Villaverde Castro - [@clankirfed](https://twitter.com/clankirfed)


<!-- ACKNOWLEDGEMENTS -->

## Acknowledgements
* [TOC Generator](https://github.com/ekalinin/github-markdown-toc)


## License


[![GitHub license][license-shield]][license-url]

Distributed under the GNU GPL-v3 License. See [LICENSE][license-url] on for more information.


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[license-shield]: https://img.shields.io/badge/license-GNU%20GPL--v3-brightgreen
[license-url]: https://github.com/pvillaverde/selfoss-docker-image/blob/main/LICENSE
[project-url]: https://github.com/pvillaverde/selfoss-docker-image
[issues-url]: https://github.com/pvillaverde/selfoss-docker-image/issues

