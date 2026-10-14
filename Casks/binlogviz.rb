cask "binlogviz" do
  version "0.24.0"

  on_macos do
    on_intel do
      sha256 "ab7a968dd2d31e91b768795f3d3b4e6df92f7dc1a05908187c19c1622e0e008d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.24.0/binlogviz_0.24.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "95739209c3a64b794a52648d0ee5335a6a3fcf83dc250972ebb0ad3320df345e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.24.0/binlogviz_0.24.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "8ccc4bdb050c1b96f0e666c3ffd95958f49b2ee3e47fcd6486bf8cd111fff363"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.24.0/binlogviz_0.24.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "2c9bb71a815a11500f491c1f7cfa474d387f8b576d76cf604d8c194c9554d874"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.24.0/binlogviz_0.24.0_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
