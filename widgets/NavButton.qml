/* vim: set et ts=4 sts=4 sw=4: */
/* SPDX-License-Identifier: BSD-2-Clause */
/* Copyright © 2024 David Llewellyn-Jones */

import QtQuick.Controls

Button {
    icon.height: 32
    icon.width: 32
    icon.color: enabled ? "transparent" : "gray"

    height: parent.height
    width: height * 1.2
}
