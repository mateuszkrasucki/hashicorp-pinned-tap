package main

import (
	"bytes"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestPrintOSSFormula(t *testing.T) {
	product := "consul"
	version := "1.13.2"
	config := "./config.hcl"
	buf := new(bytes.Buffer)
	expect := `class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.13.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_darwin_amd64.zip"
    sha256 "6c3783e7f23b7b686ff41e79851a09053855052f9636c4ba2db52f49467f6a4a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_darwin_arm64.zip"
    sha256 "25549bf10cadffe8b2e57204624ec36f234077ce83f7c5e61e1c26d0ada6ae3a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_linux_amd64.zip"
    sha256 "a72e88cbfec6c0fb3620cd58314ff0b42fc9d605a5192d6a568a417180f0b35f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_linux_arm.zip"
    sha256 "e507590c4d044bc50651a6a64c25a1d02fd94bd9aaa7f27f93865b750f32d735"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_linux_arm64.zip"
    sha256 "f3c38df5abe515b29520ff72ef11f05013d8da25109da425b1b9e1df1f3c3cc6"
  end

  conflicts_with "consul"

  def install
    bin.install "consul"
  end

  plist_options manual: "consul agent -dev -bind 127.0.0.1"

  def plist; <<~EOS
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{opt_bin}/consul</string>
        <string>agent</string>
        <string>-dev</string>
        <string>-bind</string>
        <string>127.0.0.1</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/consul.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/consul.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/consul --version"
  end
end
`

	err := printFormula(product, version, config, buf)
	require.Nil(t, err)
	assert.Equal(t, expect, buf.String())
}

func TestPrintENTFormula(t *testing.T) {
	product := "consul-enterprise"
	version := "1.13.2+ent"
	config := "./config.hcl"
	buf := new(bytes.Buffer)
	expect := `class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.13.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_darwin_amd64.zip"
    sha256 "23e6194bea0c7024d507c5339db4c41e53d6200eae3618d96dc2dd3858ad8357"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_darwin_arm64.zip"
    sha256 "08d007e82b3ce669bffef522f15c93b598d6e1d416b1b61504d66ec3ef14fa31"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_linux_amd64.zip"
    sha256 "5442ab15f7374c3488d5ea06a8fb72b97a19a0096b6fc587c7608387e28ab01d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_linux_arm.zip"
    sha256 "b29f186f4ca3a33b6851da74455daa94308404bcbecbd95087b1cc5f95267711"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.2+ent/consul_1.13.2+ent_linux_arm64.zip"
    sha256 "cb76403a31ecec5e945b56d91aed71f1fad0ee68102a4afead2f0c42274374d5"
  end

  conflicts_with "consul-enterprise"

  def install
    bin.install "consul"
  end

  plist_options manual: "consul agent -dev -bind 127.0.0.1"

  def plist; <<~EOS
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{opt_bin}/consul</string>
        <string>agent</string>
        <string>-dev</string>
        <string>-bind</string>
        <string>127.0.0.1</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/consul.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/consul.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/consul --version"
  end
end
`

	err := printFormula(product, version, config, buf)
	require.Nil(t, err)
	assert.Equal(t, expect, buf.String())
}
