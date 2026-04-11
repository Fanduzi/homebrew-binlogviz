cask "binlogviz" do
  version "0.14.0"

  on_macos do
    on_intel do
      sha256 "ddf97792076daf5c3058f1a18b176507022cc309a66d05888710b7364ec24a8c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.14.0/binlogviz_0.14.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "bf843c7827926bacba12c0778456657684cc5cec70123bc06ea0d5fb15113a84"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.14.0/binlogviz_0.14.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "0d1da02928bc984bf75e7d7574c5db80fd77ae67ce040ea0440c715809d02125"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.14.0/binlogviz_0.14.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "45130dc646078b954fd954360ee2cd9ad62eecdfa4243c95979992418a6d6d7d"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.14.0/binlogviz_0.14.0_linux_arm64.tar.gz",
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
