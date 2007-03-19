<?xml version="1.0"?>
<!--
 -
 -  $Id$
 -
 -  This file is part of the OpenLink Software Virtuoso Open-Source (VOS)
 -  project.
 -
 -  Copyright (C) 1998-2006 OpenLink Software
 -
 -  This project is free software; you can redistribute it and/or modify it
 -  under the terms of the GNU General Public License as published by the
 -  Free Software Foundation; only version 2 of the License, dated June 1991.
 -
 -  This program is distributed in the hope that it will be useful, but
 -  WITHOUT ANY WARRANTY; without even the implied warranty of
 -  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 -  General Public License for more details.
 -
 -  You should have received a copy of the GNU General Public License along
 -  with this program; if not, write to the Free Software Foundation, Inc.,
 -  51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 -
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:v="http://www.openlinksw.com/vspx/"
                xmlns:vm="http://www.openlinksw.com/vspx/weblog/"
                xmlns:ods="http://www.openlinksw.com/vspx/ods/">
  <xsl:template match="vm:menu-bar">
<!--
    <ods:ods-bar app_type='nntpf'/>
 -->
    <table class="menubar">
      <tr>
        <td class="menuitem">
          <v:url value="Home" format="%s" url="nntpf_main.vspx" />
        </td>
        <v:template type="simple" condition="nntpf_groups_defined_p()">
          <td class="menuitem">
            <v:url value="Post" url="nntpf_post.vspx" />
          </td>
        </v:template>
        <v:template type="simple" condition="self.vc_authenticated">
          <td class="menuitem">
            <v:url value="My RSS" format="%s" url="nntpf_edit_rss.vspx" />
          </td>
          <td class="menuitem">
            <v:url value="Subscriptions" format="%s" url="nntpf_subs.vspx" />
          </td>
          <td><!-- neccessery to stretch the table --> </td>
          <v:template type="simple"
                      condition="nntpf_conductor_installed_p()">
            <td>
              <v:url value="NNTP Server admin" format="%s"
                     url="nntpf_yacutia.vspx"
                     enabled='--nntpf_check_is_dav_admin (self.u_name, self.u_full_name)' />
              <![CDATA[&nbsp;&nbsp;]]>
              <v:url value="Settings" format="%s"
                     url="nntpf_odsnewsgroups_admin.vspx"
                     enabled='--nntpf_check_is_dav_admin (self.u_name, self.u_full_name)' />
            </td>
          </v:template>
        </v:template>
        <td class="last_cell">
          <vm:nntpf-search/>
        </td>
      </tr>
    </table>
    
  </xsl:template>
  <xsl:template match="vm:menu-bar-no-search">
    <table class="menubar" style="border: 1px solid">
      <tr>
        <td class="menuitem">
          <v:url value="--'Home'" format="%s" url="--'nntpf_main.vspx'" />
        </td>
        <v:template type="simple" condition="nntpf_groups_defined_p()">
          <td class="menuitem">
            <v:url value="Post" url="--'nntpf_post.vspx'" />
          </td>
        </v:template>
        <v:template type="simple" condition="self.vc_authenticated">
          <td class="menuitem">
            <v:url value="--'My RSS'" format="%s" url="--'nntpf_edit_rss.vspx'" />
          </td>
          <td>
          <td><!-- neccessery to stretch the table --></td>
          </td>
          <td>
            <v:url value="--'  NNTP Server admin '"
                   format="%s"
                   url="--'nntpf_yacutia.vspx'"
                   enabled='--nntpf_check_is_dav_admin (self.u_name, self.u_full_name)' />
              <![CDATA[&nbsp;&nbsp;]]>
              <v:url value="Settings" format="%s"
                     url="nntpf_odsnewsgroups_admin.vspx"
                     enabled='--nntpf_check_is_dav_admin (self.u_name, self.u_full_name)' />
          </td>

        </v:template>
           <td class="last_cell"><!-- neccessery to stretch the table --></td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
