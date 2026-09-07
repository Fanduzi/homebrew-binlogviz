cask "binlogviz" do
  version "0.23.5"

  on_macos do
    on_intel do
      sha256 "ab2fc49583c7c2f463780388be239a96d03fba77ccbdc97756268b15fbd7648d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.5/binlogviz_0.23.5_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "d7787867e3258e2861cbf46c0f7b48c3c39cef8496aaca0f7d5064afd4be9f30"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.5/binlogviz_0.23.5_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "0d8357470666ab5658cddefff28b7a1feb7cd97ec15048e6cdfe39796d41b2d9"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.5/binlogviz_0.23.5_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "e726b1595e31a172619ba44d217bc474b6214ee176feae74873b0312239efcbd"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.5/binlogviz_0.23.5_linux_arm64.tar.gz",
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
