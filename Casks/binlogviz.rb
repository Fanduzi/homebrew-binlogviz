cask "binlogviz" do
  version "0.34.0"

  on_macos do
    on_intel do
      sha256 "bade43efe7e22cc1e9786c9ce41a2894780bcdb87b0f7febf25f13577b9c491f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.34.0/binlogviz_0.34.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "c23d0ee85aa2507ea95cec106efd7b4bc8704b20d5c42c573c4c7838adce4b21"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.34.0/binlogviz_0.34.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "961ba7b650f9a81436c2f91cf6664eda144dda89236632a416ccd65818361e5f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.34.0/binlogviz_0.34.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "44dae6b9bf51661ff4610e5c571639b44970f42f46544ca46f67fdb6fb734eba"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.34.0/binlogviz_0.34.0_linux_arm64.tar.gz",
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
