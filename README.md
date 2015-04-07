# transformative [![Build Status](https://travis-ci.org/bvn-architecture/transformative.svg?branch=gh-pages)](https://travis-ci.org/bvn-architecture/transformative)

This is the repo behind [Transformative](http://bvn-architecture.github.io/transformative/) which is a magazine-esque content stream from [BVN](http:bvn.com.au).

It uses Jekyll and GH pages. If you spot any inacuaracies or you'd like to contribute something then submit a pull request.

#Plugin templates#
There are a few templates that make it easier to ensure properly formatted markup.

##Blockquotes##
Borrowing the blockquote pattern from [A list apart](http://alistapart.com/blog/post/more-thoughts-about-blockquotes-than-are-strictly-required)

```
{% quote { "person" : "", "source" : "", "date" : ""  } %}
	The quote.
{% endquote %}
```

##Videos##

```
{% vimeo 107651239 %}
```
and

```
{% youtube 107651239 %}
```

#front matter#
This is the current post front matter. 
```
---
layout         : post
title          : "Arup"
tagline        : "Workplace"

assetsfolder   : "arup"
imgfeatured    : "arup.jpg"
imgtitletext   : "title goes here"
imgalttext     : "This is an image of something"
date           : 2015-02-22 16:57:05
categories     : transformative-4
publisher-name : BVN
author-name    : Stella DeVulder
---
```