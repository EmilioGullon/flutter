// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:ui/src/engine.dart';

/// 50x50 pixel flutter logo image that contains alpha ramps and colors
/// specifically to transparency and blending.
const String _flutterLogoBase64 =
    'iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAKRlWElm'
    'TU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgExAAIAAAAg'
    'AAAAWodpAAQAAAABAAAAegAAAAAAAABIAAAAAQAAAEgAAAABQWRvYmUgUGhvdG9zaG9wIENT'
    'NiAoTWFjaW50b3NoKQAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAMqADAAQAAAABAAAAMgAA'
    'AABWBXsWAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEemlUWHRYTUw6Y29tLmFkb2JlLnhtcAAA'
    'AAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENv'
    'cmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5'
    'OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjph'
    'Ym91dD0iIgogICAgICAgICAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94'
    'YXAvMS4wL21tLyIKICAgICAgICAgICAgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5j'
    'b20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiCiAgICAgICAgICAgIHhtbG5zOnhtcD0i'
    'aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0i'
    'aHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAgICAgICA8eG1wTU06SW5zdGFu'
    'Y2VJRD54bXAuaWlkOjMyOERERjc5ODRCRjExRUE5QUE4OEM5NTZDREM5QkUyPC94bXBNTTp'
    'JbnN0YW5jZUlEPgogICAgICAgICA8eG1wTU06RG9jdW1lbnRJRD54bXAuZGlkOjMyOERERj'
    'dBODRCRjExRUE5QUE4OEM5NTZDREM5QkUyPC94bXBNTTpEb2N1bWVudElEPgogICAgICAgI'
    'CA8eG1wTU06T3JpZ2luYWxEb2N1bWVudElEPnhtcC5kaWQ6MDE4MDExNzQwNzIwNjgxMTgy'
    'MkFBQjU0OEFBMDMwM0E8L3htcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD4KICAgICAgICAgPHht'
    'cE1NOkRlcml2ZWRGcm9tIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICA'
    'gPHN0UmVmOmluc3RhbmNlSUQ+eG1wLmlpZDowNDgwMTE3NDA3MjA2ODExODIyQUFCNTQ4QU'
    'EwMzAzQTwvc3RSZWY6aW5zdGFuY2VJRD4KICAgICAgICAgICAgPHN0UmVmOmRvY3VtZW50SU'
    'Q+eG1wLmRpZDowMTgwMTE3NDA3MjA2ODExODIyQUFCNTQ4QUEwMzAzQTwvc3RSZWY6ZG9jd'
    'W1lbnRJRD4KICAgICAgICAgPC94bXBNTTpEZXJpdmVkRnJvbT4KICAgICAgICAgPHhtcDpD'
    'cmVhdG9yVG9vbD5BZG9iZSBQaG90b3Nob3AgQ1M2IChNYWNpbnRvc2gpPC94bXA6Q3JlYXRv'
    'clRvb2w+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb2'
    '4+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhP'
    'gr/+ApQAAAQNUlEQVRoBbVaDYxdRRWemTv3vt2WbrctpRYxtCVU4io1LomElrjYWnbbgtr2'
    'CbISwGpR0UBUjD8YHyZCNCqIP5GmtLWSAn3SVYqw7PbnFUQFXGOMRUFlW9G2gKalu/veu38'
    'zfufce3ff275dWtBJ5s7cuTPnnO+cM2d+3pN2urDiVSHEVCFuOpgT35vVIuaLV8Tgtw8Icf'
    'PZkZgntDggrhNCbhHCuihD9J402Y4OLUulqNy1+iwvFIscaaqRMWqyQRofIxFH2ohpwqjDc'
    't/OZyyYSTAVHQUtSoVIfPiL7xWu3i2i0KA7PnFmstpaEVMLBnHm1rFHhEbiQZ9PKtl83pPF'
    'YnB0xVVne2HlKcdz5wgTC62cZLwlGdJUSxXtWnngFItIOhdzj3xeiWIxzrpPVmpAZg4EJjc'
    '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';

HtmlImage createFlutterLogoTestImage() {
  return HtmlImage(
    createDomHTMLImageElement()..src = 'data:text/plain;base64,$_flutterLogoBase64',
    50,
    50,
  );
}
