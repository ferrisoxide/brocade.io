# brocade.io

Open GTIN / barcode &amp; product database

## Project Background

Over the years there have been several attempts at creating a freely accessible database of GTIN/barcodes and associated product data.

Many of these projects have either stalled or disappeared: the [Outpan API](https://www.outpan.com/developers.php) vanished without warning, [Open Product Data](http://product-open-data.com/download) doesn't appear to have been updated since 2014 and recently [Datakick](https://www.datakick.org/) announced they will be shutting down as of March 31, 2020.

There are still numerous commercial providers, but the number of freely accessible product data sources seems to be severely limited, with the [Internet UPC Database](https://www.upcdatabase.com/) being one of the few open services able to sustain itself. For a universal dataset, UPC and related data isn't universally accessible.

## Project Goals

### Open Access

The project aims to present as few barriers as possible to accessing GTIN and product data. The code for providing the service will be released under as open source (see LICENSE for details) and wherever possible the data will be made available under open licenses.

There may be a need to apply some constraints - _e.g._ rate limiting or requiring authorisation for certain tasks - but these will only be introduced for the sake of performance, security or similar concerns.

### Federated/Distributed Data

The project _is not_ intended to be a single source of truth for product data. Instead the goal is to provide a framework for sharing product data between otherwise autonomous sources.

It's anticipated that the project will require novel protocols for federating data between disparate systems, and will be looking for inspiration from other federated or distributed systems (_e.g._DNS, Open Social, _etc_).

### Migration Path

The initial goal for this project is to establish a migration path for users of existing APIs - notably Datakick. One aim is to provide a Datakick-compatible endpoint to allow developers

The database will initially be seeded using data sourced from Datakick.

## Getting Started

This section will have to be added to as the project proceeds, but for now assume a technology stack based around Ruby on Rails and Postgres.
